*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Delete ###################
DeleteThingsFromWorker_TST_F24_0_2_000_Error_WorkerIdNotFound
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Worker
	...    3.Create A Thing Not Have WorkerId
	...    4.Assign Things to Workers
	...    5.Delete a Worker
	...    6.Delete Things from worker
	...    7.Delete a Thing	

	#====== Start Prepare data ==========

	# Prepare data for create thing
	${CustomDetails}=    Set Variable    {}
	${valArrData}=    Prepare data for Create A Thing    1    ${VALUE_CONNECTIVITYTYPE_NBIOT}    ${VALUE_THINGSTATE_IDLE}    ${CustomDetails}
	Log To Console    valArrData is : ${valArrData}
	${valArrData0}=    Set Variable    ${valArrData}[0]

    ${IMEI}=    Set Variable    ${valArrData0[0]['IMEI']}
    ${ThingSecret}=    Set Variable    ${valArrData0[0]['ThingSecret']}
    ${ThingIdentifier}=    Set Variable    ${valArrData0[0]['ThingIdentifier']}
	${ConnectivityType}=    Set Variable    ${valArrData0[0]['ConnectivityType']}
	${ThingState}=    Set Variable    ${valArrData0[0]['ThingState']}

	# Prepare data for Request CreateData
	# [WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName,dataAssignThingsToWorkers]
	${createResponse}=    Request CreateData for CreateAWorker CreateAThingNotHaveWorkerId and AssignThingsToWorkers    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_ACTIVATED}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
	Log To Console    createResponse is : ${createResponse}

    ${WorkerId}=    Set Variable    ${createResponse}[0]
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerName}=    Set Variable    ${createResponse}[1]
    Log To Console    WorkerName is : ${WorkerName}

	@{workerIdArr}=    Create List
	Append To List    ${workerIdArr}    ${WorkerId}    #Add data to array set at valArrData
    Log To Console    workerIdArr is : ${workerIdArr}

	${ThingId}=    Set Variable    ${createResponse}[2]
    Log To Console    ThingId is : ${ThingId}
	@{thingIdArr}=    Create List
	Append To List    ${thingIdArr}    ${ThingId}        #Add data to array set at valArrData
    Log To Console    thingIdArr is : ${thingIdArr}

	${ThingName}=    Set Variable    ${createResponse}[3]
    Log To Console    ThingName is : ${ThingName}

	${SupplierId}=    Set Variable    ${createResponse}[4]
    Log To Console    SupplierId is : ${SupplierId}

	${SupplierName}=    Set Variable    ${createResponse}[5]
    Log To Console    SupplierName is : ${SupplierName}
	
    #urlDeleteThingsFromWorker
	${urlDeleteThingsFromWorker}=    Replace String    ${URL_DELETETHINGSFROMWORKER}    WorkerId    ${WorkerId}
    Log To Console    urlDeleteThingsFromWorker is : ${urlDeleteThingsFromWorker}

	#DeleteAWorker
    ${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${WorkerId}
	Log To Console    postDeleteAWorker: :${postDeleteAWorker} 

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETETHINGSFROMWORKER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETETHINGSFROMWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {"ThingId":"${ThingId}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${urlDeleteThingsFromWorker}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${DELETETHINGSFROMWORKER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    #====== Start Prepare data : Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${urlDeleteThingsFromWorker}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETETHINGSFROMWORKER_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection"]
	# ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    [{"Target":"WorkerId","DeveloperMessage":"The WorkerId '${WorkerId}' could not be found."}]
	${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}

	${bodyLog}=    Set Variable    {"ThingId":"${ThingId}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}"}
    
	#====== End Prepare data : Check log ==========

    #====== Check log ==========

	#Check log detail and summary
    Log DeleteThingsFromWorker Error    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}    ${cmdName}

    [Teardown]    Generic Test Case Teardown    ${THINHG}    ${thingIdArr}    null
