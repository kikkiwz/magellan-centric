*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Delete ###################
DeleteAWorker_TST_F19_1_1_000_Success
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Delete a Worker

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
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request Not Data    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_DELETEAWORKER}${WorkerId}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${DELETEAWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${URL_DELETEAWORKER}${WorkerId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETEAWORKER}${current_timestamp}

	${bodyDB}=    Evaluate    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIPCreate}","ServerPort":"${ServerPortCreate}","ServerDomain":"${ServerDomainCreate}"},"WorkerState":"${WorkerStateCreate}"}
	
	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log DeleteAWorker Success    ${res}    ${pathUrl}    ${dataSearch}    ${WorkerName}    ${ServerIPCreate}    ${ServerPortCreate}    ${ServerDomainCreate}    ${WorkerStateCreate}    ${WorkerId}  

    #Inquiry for verify DB   
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data Workers    ${DELETEAWORKER}    ${WorkerName}    ${bodyDB}    ${WorkerId}
    
    # [Teardown]    Generic Test Case Teardown    ${DELETEAWORKER}    null    ${WorkerId}
    