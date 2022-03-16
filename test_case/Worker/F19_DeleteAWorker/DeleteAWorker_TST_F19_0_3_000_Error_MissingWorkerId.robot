*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Delete ###################
DeleteAWorker_TST_F19_0_3_000_Error_MissingWorkerId
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Delete a Worker
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

    ${WorkerId}=    Set Variable    ${VALUE_WORKERID_TEST}
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerIdCreate}=    Set Variable    ${postCreateAWorker}[0]
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerName}=    Set Variable    ${postCreateAWorker}[1]
    Log To Console    WorkerName is : ${WorkerName}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAWORKER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request Not Data    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_DELETEAWORKER}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${DELETEAWORKER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40500}    ${VALUE_DESCRIPTION_METHODNOTALLOWED_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${URL_DELETEAWORKER}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETEAWORKER_FAIL}${current_timestamp}
	
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    null

	#====== Check log ==========

	#Check log detail and summary
    Log DeleteAWorker Error    ${VALUE_LOG_CODE_40500}    ${VALUE_DESCRIPTION_METHODNOTALLOWED_ERROR}    ${VALUE_LOG_CODE_40500}    ${VALUE_DESCRIPTION_METHODNOTALLOWED_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}

    [Teardown]    Generic Test Case Teardown    ${DELETEAWORKER}    null    ${WorkerIdCreate}