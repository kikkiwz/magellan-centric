*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
ReturnsAListOfWorker_TST_F15_1_1_000_Success_FillterWorkerId
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Returns a list of Worker
	...    3.Delete a Worker

	#====== Start Prepare data ==========

	${ServerIPCreate}=    Set Variable    ${VALUE_SERVERIP}
	Log To Console    ServerIP Create is : ${ServerIPCreate}
	${ServerPortCreate}=    Set Variable    ${VALUE_SERVERPORT}
	Log To Console    ServerPort Create is : ${ServerPortCreate}
	${ServerDomainCreate}=    Set Variable    ${VALUE_SERVERDOMAIN}
	Log To Console    ServerDomain Create is : ${ServerDomainCreate}
	${WorkerStateCreate}=    Set Variable    ${VALUE_WORKERSTATE_TERMINATED}
	Log To Console    WorkerState Create is : ${WorkerStateCreate}

	${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIPCreate}    ${ServerPortCreate}    ${ServerDomainCreate}    ${WorkerStateCreate}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${WorkerId}=    Set Variable    ${postCreateAWorker}[0]
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerName}=    Set Variable    ${postCreateAWorker}[1]
    Log To Console    WorkerName is : ${WorkerName}

	${fillter}=    Replace String    ${VALUE_CENTRIC_RETURNSALISTOFWORKER_FILLTERWORKERID}    [WorkerId]    ${WorkerId}
    Log To Console    fillter is : ${fillter}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_RETURNSALISTOFWORKER}${fillter}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${RETURNSALISTOFWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

	#GetResponse
    ${WorkersInfo}=    Set Variable    ${res['WorkerInfo'][0]}
	Log To Console    WorkersInfo is : ${WorkersInfo}
	${GetResponse_WorkerId}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_WORKERID}     
	Log To Console    WorkerId is : ${GetResponse_WorkerId}
	${GetResponse_ServerProperties}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_SERVERPROPERTIES}  
	${GetResponse_ServerIP}=    Get From Dictionary    ${GetResponse_ServerProperties}     ${FIELD_SERVERIP}    
	${GetResponse_ServerPort}=    Get From Dictionary    ${GetResponse_ServerProperties}     ${FIELD_SERVERPORT}   
	${GetResponse_ServerDomain}=    Get From Dictionary    ${GetResponse_ServerProperties}     ${FIELD_SERVERDOMAIN}   
	${GetResponse_WorkerState}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_WORKERSTATE}   
	${GetResponse_WorkerName}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_WORKERNAME}   
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerId}    ${WorkerId}  
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerIP}    ${ServerIPCreate}    
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerPort}    ${ServerPortCreate}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerDomain}    ${ServerDomainCreate}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerState}    ${WorkerStateCreate}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerName}    ${WorkerName}

    ${pathUrl}=    Set Variable    ${URL_RETURNSALISTOFWORKER}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWORKER}${current_timestamp}

	${bodyLog}=    Set Variable    {"$Filter":"WorkerId eq '${WorkerId}'"}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log ReturnsAListOfWorker Success    ${res}    ${pathUrl}    ${dataSearch}    ${bodyLog}

	[Teardown]    Generic Test Case Teardown    ${RETURNSALISTOFWORKER}    null    ${WorkerId}
