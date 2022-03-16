*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAWorker_TST_F14_1_1_001_Success_WorkerStateIsTerminated
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Delete a Worker

	#====== Start Prepare data ==========

	${ServerIP}=    Set Variable    ${VALUE_SERVERIP}
	${ServerPort}=    Set Variable    ${VALUE_SERVERPORT}
	${ServerDomain}=    Set Variable    ${VALUE_SERVERDOMAIN}
	${WorkerState}=    Set Variable    ${VALUE_WORKERSTATE_TERMINATED}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#WorkerName
    ${random_number}=    generate random string    6    [NUMBERS]
    ${WorkerName}=    Set Variable    ${VALUE_WORKNAME}${random_number}
    Log To Console    WorkerName is : ${WorkerName}

	#Body
    ${body}=    Evaluate    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_CREATEAWORKER}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEAWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
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
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerIP}    ${ServerIP}    
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerPort}    ${ServerPort}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ServerDomain}    ${ServerDomain}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerState}    ${WorkerState}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerName}    ${WorkerName}

    ${pathUrl}=    Set Variable    ${URL_CREATEAWORKER}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEAWORKER}${current_timestamp}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log CreateAWorker Success    ${res}    ${pathUrl}    ${dataSearch}    ${WorkerName}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}  

    #Inquiry for verify DB   
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data Workers    ${CREATEAWORKER}    ${WorkerName}    ${body}    ${GetResponse_WorkerId}
    
    [Teardown]    Generic Test Case Teardown    ${CREATEAWORKER}    null    ${GetResponse_WorkerId}
    