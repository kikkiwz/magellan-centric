*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
GetAWorkerByWorkerId_TST_F16_1_1_000_Success
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Get a Worker by WorkerId
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

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_GETAWORKERBYWORKERID}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_GETAWORKERBYWORKERID}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_GETAWORKERBYWORKERID}${WorkerId}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${GETAWORKERBYWORKERID}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    #GetResponse_WorkerId
    ${WorkersInfo}=    Get From Dictionary    ${res}     ${FIELD_WORKERSINFO}   
	${GetResponse_WorkerId}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_WORKERID}     
	Log To Console    WorkerId is : ${GetResponse_WorkerId}

	${GetResponse_ServerProperties}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_SERVERPROPERTIES}  
	${GetResponse_ServerIP}=    Get From Dictionary    ${GetResponse_ServerProperties}     ${FIELD_SERVERIP}    
	${GetResponse_ServerPort}=    Get From Dictionary    ${GetResponse_ServerProperties}     ${FIELD_SERVERPORT}   
	${GetResponse_ServerDomain}=    Get From Dictionary    ${GetResponse_ServerProperties}     ${FIELD_SERVERDOMAIN}   
	${GetResponse_WorkerState}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_WORKERSTATE}   
	${GetResponse_WorkerName}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_WORKERNAME}   
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerIP}    ${ServerIPCreate}    
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerPort}    ${ServerPortCreate}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerDomain}    ${ServerDomainCreate}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerState}    ${WorkerStateCreate}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerName}    ${WorkerName}

    ${pathUrl}=    Set Variable    ${URL_GETAWORKERBYWORKERID}${WorkerId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_GETAWORKERBYWORKERID}${current_timestamp}

	${bodyDB}=    Evaluate    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIPCreate}","ServerPort":"${ServerPortCreate}","ServerDomain":"${ServerDomainCreate}"},"WorkerState":"${WorkerStateCreate}"}
	
	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log GetAWorkerByWorkerId Success    ${res}    ${pathUrl}    ${dataSearch}    ${WorkerName}    ${ServerIPCreate}    ${ServerPortCreate}    ${ServerDomainCreate}    ${WorkerStateCreate}    ${WorkerId}  

    #Inquiry for verify DB   
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data Workers    ${GETAWORKERBYWORKERID}    ${WorkerName}    ${bodyDB}    ${WorkerId}
    
    [Teardown]    Generic Test Case Teardown    ${GETAWORKERBYWORKERID}    null    ${WorkerId}
    