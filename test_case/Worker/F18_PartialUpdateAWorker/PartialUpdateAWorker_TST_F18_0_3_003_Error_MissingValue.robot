*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Patch ###################
PartialUpdateAWorker_TST_F18_0_3_003_Error_MissingValue
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Delete a Worker
	...    3.Partial Update a Worker

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

	${op}=    Set Variable    ${VALUE_PARTIALUPDATE_OP_REPLACE}
	${path}=    Set Variable    ${VALUE_PARTIALUPDATE_PATH_SERVERPROPERTIES_SERVERDOMAIN}
	${value}=    Set Variable    ${VALUE_PARTIALUPDATE_SERVERDOMAIN}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_PARTIALUPDATEAWORKER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEAWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#Body
    ${body}=    Evaluate    [{"op":"${op}","path":"${path}"}]
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Patch Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_PARTIALUPDATEAWORKER}${WorkerId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${PARTIALUPDATEAWORKER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${URL_PARTIALUPDATEAWORKER}${WorkerId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_PARTIALUPDATEAWORKER_FAIL}${current_timestamp}
	
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    
    # ${endPointName}=    Set Variable    ["db.WorkersCollection"]
	# ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
    ${responseObjectDetail}=    Set Variable    [{"Target":"ServerProperties.ServerDomain","DeveloperMessage":"'ServerDomain' must not be empty."}]
    ${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}

	${bodyLog}=    Set Variable    [{"op":"${op}","path":"${path}"}]

	#====== Check log ==========

	#Check log detail and summary
    Log PartialUpdateAWorker Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${cmdName}    ${bodyLog}

    [Teardown]    Generic Test Case Teardown    ${PARTIALUPDATEAWORKER}    null    ${WorkerId}
    