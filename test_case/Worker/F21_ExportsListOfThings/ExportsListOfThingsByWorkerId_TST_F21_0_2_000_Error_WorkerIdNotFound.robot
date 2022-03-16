*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
ExportsListOfThingsByWorkerId_TST_F21_0_2_000_Error_WorkerIdNotFound
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Imports list of Thing by WorkerId
	...    3.Exports  list of Things by WorkerId	
	...    4.Delete a Thing	
	...    5.Delete a Worker

	#====== Start Prepare data ==========

	# Prepare data for create thing
	${CustomDetails}=    Set Variable    {}
	${valArrData}=    Prepare data for Create A Thing for Import    1    ${VALUE_CONNECTIVITYTYPE_NBIOT}    ${VALUE_THINGSTATE_IDLE}    ${CustomDetails}
	Log To Console    valArrData is : ${valArrData}
	${valArrData0}=    Set Variable    ${valArrData}[0]

	${ThingName}=    Set Variable    ${valArrData0[0]['ThingName']}
    ${IMEI}=    Set Variable    ${valArrData0[0]['IMEI']}
    ${ThingSecret}=    Set Variable    ${valArrData0[0]['ThingSecret']}
    ${ThingIdentifier}=    Set Variable    ${valArrData0[0]['ThingIdentifier']}
	${SupplierDetail}=    Set Variable    ${valArrData0[0]['SupplierDetail']}
	${SupplierId}=    Set Variable    ${SupplierDetail['SupplierId']}
	${SupplierName}=    Set Variable    ${SupplierDetail['SupplierName']}
	${ConnectivityType}=    Set Variable    ${valArrData0[0]['ConnectivityType']}
	${ThingState}=    Set Variable    ${valArrData0[0]['ThingState']}

	# Prepare data for Request CreateData
	# [WorkerId,WorkerName,responseImportsListOfThingByWorkerIdArray]
	${createResponse}=    Request CreateData for CreateAWorker and ImportsListOfThingByWorkerId    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_ACTIVATED}    ${valArrData}[1]
	Log To Console    createResponse is : ${createResponse}

    ${WorkerId}=    Set Variable    ${createResponse}[0]
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerName}=    Set Variable    ${createResponse}[1]
    Log To Console    WorkerName is : ${WorkerName}

    #urlExportsListOfThingsByWorkerId
	${urlExportsListOfThingsByWorkerId}=    Replace String    ${URL_EXPORTSLISTOFTHINGBYWORKERID}    WorkerId    ${WorkerId}
    Log To Console    urlExportsListOfThingsByWorkerId is : ${urlExportsListOfThingsByWorkerId}

    #Exports list of Things
    ${postExportsListOfThings}=    Exports list of Things    ${URL_CENTRIC}    ${WorkerId}
    Log To Console    postExportsListOfThings :${postExportsListOfThings}

	${thingIdArr}=    Set Variable    ${postExportsListOfThings}
	Log To Console    thingIdArr is : ${thingIdArr}

    #DeleteAWorker
    ${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${WorkerId}
	Log To Console    postDeleteAWorker: :${postDeleteAWorker} 

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_EXPORTSLISTOFTHINGBYWORKERID}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${urlExportsListOfThingsByWorkerId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${EXPORTSLISTOFTHINGBYWORKERID}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    #====== Start Prepare data : Check log ==========

    ${pathUrl}=    Set Variable    ${urlExportsListOfThingsByWorkerId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection"]
	# ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    [{"Target":"WorkerId","DeveloperMessage":"The WorkerId '${WorkerId}' could not be found."}]
	${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}

	#====== End Prepare data : Check log ==========

    #====== Check log ==========

	#Check log detail and summary
    Log ExportsListOfThingsByWorkerId Error    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${cmdName}

    [Teardown]    Generic Test Case Teardown    ${THINHG}    ${thingIdArr}    null

