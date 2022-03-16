*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAWorker_TST_F14_0_3_005_Error_MissingWorkerState
    [Documentation]    Step is :    
	...    1.Create a Worker

	#====== Start Prepare data ==========

	${ServerIP}=    Set Variable    ${VALUE_SERVERIP}
	${ServerPort}=    Set Variable    ${VALUE_SERVERPORT}
	${ServerDomain}=    Set Variable    ${VALUE_SERVERDOMAIN}
	${WorkerState}=    Set Variable    ${VALUE_WORKERSTATE_ACTIVATED}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAWORKER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#WorkerName
    ${random_number}=    generate random string    6    [NUMBERS]
    ${WorkerName}=    Set Variable    ${VALUE_WORKNAME}${random_number}
    Log To Console    WorkerName is : ${WorkerName}

	#Body
    ${body}=    Evaluate    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"}}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_CREATEAWORKER}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEAWORKER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${URL_CREATEAWORKER}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEAWORKER_FAIL}${current_timestamp}

	${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    [{"Target":"WorkerState","DeveloperMessage":"'WorkerState' must not be empty."}]

	${bodyLog}=    Set Variable    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"}}

	#====== Check log ==========

	#Check log detail and summary
    Log CreateAWorker Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}
