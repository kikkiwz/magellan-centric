*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
AssignThingsToWorkers_TST_F22_1_1_001_Success_SendThingId
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create A Thing Not Have WorkerId
	...    3.Assign Things to Workers
	...    4.Delete a Thing	
	...    5.Delete a Worker

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
	# [WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName]
	${createResponse}=    Request CreateData for CreateAWorker and CreateAThingNotHaveWorkerId    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_ACTIVATED}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
	Log To Console    createResponse is : ${createResponse}

    ${WorkerId}=    Set Variable    ${createResponse}[0]
    Log To Console    WorkerId is : ${WorkerId}

	${WorkerName}=    Set Variable    ${createResponse}[1]
    Log To Console    WorkerName is : ${WorkerName}

	${ThingId}=    Set Variable    ${createResponse}[2]
    Log To Console    ThingId is : ${ThingId}
	@{thingIdArr}=    Create List
	Append To List    ${thingIdArr}    ${ThingId}        #Add data to array set at valArrData

	${ThingName}=    Set Variable    ${createResponse}[3]
    Log To Console    ThingName is : ${ThingName}

    ${SupplierId}=    Set Variable    ${createResponse}[4]
    Log To Console    SupplierId is : ${SupplierId}

	${SupplierName}=    Set Variable    ${createResponse}[5]
    Log To Console    SupplierName is : ${SupplierName}

    #urlAssignThingsToWorkers
	${urlAssignThingsToWorkers}=    Replace String    ${URL_ASSIGNTHINGSTOWORKERS}    WorkerId    ${WorkerId}
    Log To Console    urlAssignThingsToWorkers is : ${urlAssignThingsToWorkers}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_ASSIGNTHINGSTOWORKERS}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_ASSIGNTHINGSTOWORKERS}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"ThingId":"${ThingId}"}]		
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${urlAssignThingsToWorkers}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${expectResponse}=    Evaluate    [{"Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}"}]		

	${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${ASSIGNTHINGSTOWORKERS}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
    Log To Console    checkReponse is : ${checkReponse}
    	
    #====== Start Prepare data : Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${urlAssignThingsToWorkers}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_ASSIGNTHINGSTOWORKERS}${current_timestamp}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.ThingsCollection","db.ThingsCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:InquiryThing was Success"}, { "no":"3", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:UpdateThing was Success"}]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:InquiryThing was Success"}, { "no":"3", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:UpdateThing was Success"}]}     	 
	${responseObjectDetail}=    Set Variable    null

	${bodyLog}=    Set Variable    [{"ThingId":"${ThingId}"}]
    ${responseLog}=    Set Variable    [{"ThingId":"${ThingId}","WorkerId":"${WorkerId}","Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}"}]		

    ${bodyDB}=    Evaluate    [{"ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","CustomDetails":${CustomDetails},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}]		

    #====== End Prepare data : Check log and Verify DB ==========

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log AssignThingsToWorkers Success Array    ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}
    # Log AssignThingsToWorkers Success Array    ${responseLog}    ${pathUrl}    ${dataSearch}    ${bodyLog}

	${count}=    Get Length    ${bodyDB}
	# Log To Console    count is : ${count}
	FOR    ${i}    IN RANGE    ${count}
        Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data Things    ${ASSIGNTHINGSTOWORKERS}    ${ThingName}    ${bodyDB}[${i}]    ${thingIdArr}[${i}]    ${WorkerId}
    END
    [Teardown]    Generic Test Case Teardown    ${ASSIGNTHINGSTOWORKERS}    ${thingIdArr}    ${WorkerId}