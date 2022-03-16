*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Put ###################
UpdateAWorker_TST_F17_0_2_001_Error_WorkerNameDuplicate
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Worker
	...    3.Update a Worker
	...    4.Delete a Worker
	...    5.Delete a Worker

	#====== Start Prepare data ==========

	${ServerIPCreate}=    Set Variable    ${VALUE_SERVERIP}
	Log To Console    ServerIP Create is : ${ServerIPCreate}
	${ServerPortCreate}=    Set Variable    ${VALUE_SERVERPORT}
	Log To Console    ServerPort Create is : ${ServerPortCreate}
	${ServerDomainCreate}=    Set Variable    ${VALUE_SERVERDOMAIN}
	Log To Console    ServerDomain Create is : ${ServerDomainCreate}
	${WorkerStateCreate}=    Set Variable    ${VALUE_WORKERSTATE_TERMINATED}
	Log To Console    WorkerState Create is : ${WorkerStateCreate}

    #Create A Worker
	${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIPCreate}    ${ServerPortCreate}    ${ServerDomainCreate}    ${WorkerStateCreate}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${WorkerId}=    Set Variable    ${postCreateAWorker}[0]
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerName}=    Set Variable    ${postCreateAWorker}[1]
    Log To Console    WorkerName is : ${WorkerName}

    # Create A Worker
	${postCreateAWorker2}=    Create A Worker    ${URL_CENTRIC}    ${ServerIPCreate}    ${ServerPortCreate}    ${ServerDomainCreate}    ${WorkerStateCreate}
    Log To Console    postCreateAWorker2 :${postCreateAWorker2}

    ${WorkerId2}=    Set Variable    ${postCreateAWorker2}[0]
    Log To Console    WorkerId2 is : ${WorkerId2}

	${WorkerName2}=    Set Variable    ${postCreateAWorker2}[1]
    Log To Console    WorkerName2 is : ${WorkerName2}

	@{valArrWorkerId}=    Create List
	Append To List    ${valArrWorkerId}    ${WorkerId}        #Add data to array set at valArrData
	Append To List    ${valArrWorkerId}    ${WorkerId2}        #Add data to array set at valArrData
    Log To Console    valArrWorkerId is : ${valArrWorkerId}

	${ServerIP}=    Set Variable    ${VALUE_UPDATE_SERVERIP}
	Log To Console    ServerIP Update is : ${ServerIP}
	${ServerPort}=    Set Variable    ${VALUE_UPDATE_SERVERPORT}
	Log To Console    ServerPort Update is : ${ServerPort}
	${ServerDomain}=    Set Variable    ${VALUE_UPDATE_SERVERDOMAIN}
	Log To Console    ServerDomain Update is : ${ServerDomain}
	${WorkerState}=    Set Variable    ${VALUE_WORKERSTATE_ACTIVATED}
	Log To Console    WorkerState Update is : ${WorkerState}

	#WorkerName
    ${WorkerNameUpdate}=    Set Variable    ${WorkerName}
    Log To Console    WorkerName Update is : ${WorkerNameUpdate}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_UPDATEAWORKER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_UPDATEAWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#Body
    ${body}=    Evaluate    {"WorkerId":"${WorkerId2}","WorkerName":"${WorkerNameUpdate}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Put Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_UPDATEAWORKER}${WorkerId2}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${UPDATEAWORKER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${URL_UPDATEAWORKER}${WorkerId2}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_UPDATEAWORKER_FAIL}${current_timestamp}
	
	${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

    # ${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection"]
	# ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
    ${responseObjectDetail}=    Set Variable    [{"Target":"WorkerName","DeveloperMessage":"The WorkerName could not be duplicated."}]

	${bodyLog}=    Set Variable    {"WorkerId":"${WorkerId2}","WorkerName":"${WorkerNameUpdate}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}

	#====== Check log ==========

	#Check log detail and summary
    Log UpdateAWorker Error    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}

    [Teardown]    Generic Test Case Teardown    ${UPDATEAWORKER2}    null    ${valArrWorkerId}