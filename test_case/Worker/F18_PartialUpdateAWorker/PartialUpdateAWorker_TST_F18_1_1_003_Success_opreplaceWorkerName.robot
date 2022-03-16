*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Patch ###################
PartialUpdateAWorker_TST_F18_1_1_003_Success_opreplaceWorkerName
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Partial Update a Worker
	...    3.Delete a Worker

	#====== Start Prepare data ==========

	${ServerIP}=    Set Variable    ${VALUE_SERVERIP}
	Log To Console    ServerIP Create is : ${ServerIP}
	${ServerPort}=    Set Variable    ${VALUE_SERVERPORT}
	Log To Console    ServerPort Create is : ${ServerPort}
	${ServerDomain}=    Set Variable    ${VALUE_SERVERDOMAIN}
	Log To Console    ServerDomain Create is : ${ServerDomain}
	${WorkerState}=    Set Variable    ${VALUE_WORKERSTATE_ACTIVATED}
	Log To Console    WorkerState Create is : ${WorkerState}

	${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${WorkerId}=    Set Variable    ${postCreateAWorker}[0]
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerName}=    Set Variable    ${postCreateAWorker}[1]
    Log To Console    WorkerName is : ${WorkerName}

	#WorkerName
    ${random_number}=    generate random string    6    [NUMBERS]
    ${WorkerNameUpdate}=    Set Variable    ${VALUE_UPDATE_WORKNAME}${random_number}
    Log To Console    WorkerName Update is : ${WorkerNameUpdate}

	${op}=    Set Variable    ${VALUE_PARTIALUPDATE_OP_REPLACE}
	${path}=    Set Variable    ${VALUE_PARTIALUPDATE_PATH_WORKERNAME}
	${value}=    Set Variable    ${WorkerNameUpdate}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_PARTIALUPDATEAWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEAWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#Body
    ${body}=    Evaluate    [{"op":"${op}","path":"${path}","value":"${value}"}]
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Patch Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_PARTIALUPDATEAWORKER}${WorkerId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${PARTIALUPDATEAWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
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
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerName}    ${value}

    ${pathUrl}=    Set Variable    ${URL_PARTIALUPDATEAWORKER}${WorkerId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_PARTIALUPDATEAWORKER}${current_timestamp}

    ${checkLog}=    Set Variable    {"WorkerId":"${WorkerId}","WorkerName":"${value}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}

    ${bodyDB}=    Evaluate    {"WorkerId":"${WorkerId}","WorkerName":"${value}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}
    
	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log PartialUpdateAWorker Success    ${res}    ${pathUrl}    ${dataSearch}    ${checkLog}    ${op}    ${path}    ${value}

    #Inquiry for verify DB   
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data Workers    ${PARTIALUPDATEAWORKER}    ${value}    ${bodyDB}    ${WorkerId}
    
    [Teardown]    Generic Test Case Teardown    ${PARTIALUPDATEAWORKER}    null    ${WorkerId}
    