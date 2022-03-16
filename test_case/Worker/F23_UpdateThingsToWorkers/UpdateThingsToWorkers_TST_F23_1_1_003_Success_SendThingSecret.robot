*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Put ###################
UpdateThingsToWorkers_TST_F23_1_1_003_Success_SendThingSecret
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Worker
	...    3.Create A Thing Not Have WorkerId
	...    4.Assign Things to Workers
	...    5.Update Things to Workers
	...    6.Delete a Thing	
	...    7.Delete a Worker

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
	# [WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName,WorkerId2,WorkerName2,dataAssignThingsToWorkers]
	${createResponse}=    Request CreateData for CreateAWorker CreateAWorker2 CreateAThingNotHaveWorkerId and AssignThingsToWorkers    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_ACTIVATED}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
	Log To Console    createResponse is : ${createResponse}

    ${WorkerId1}=    Set Variable    ${createResponse}[0]
    Log To Console    WorkerId1 is : ${WorkerId1}

	${WorkerName1}=    Set Variable    ${createResponse}[1]
    Log To Console    WorkerName1 is : ${WorkerName1}

	${WorkerId2}=    Set Variable    ${createResponse}[6]
    Log To Console    WorkerId2 is : ${WorkerId2}

	${WorkerName2}=    Set Variable    ${createResponse}[7]
    Log To Console    WorkerName2 is : ${WorkerName2}

	@{workerIdArr}=    Create List
	Append To List    ${workerIdArr}    ${WorkerId1}    #Add data to array set at valArrData
	Append To List    ${workerIdArr}    ${WorkerId2}    #Add data to array set at valArrData
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
	
    #urlUpdateThingsToWorkers
	${urlUpdateThingsToWorkers}=    Replace String    ${URL_UPDATETHINGSTOWORKERS}    WorkerId    ${WorkerId2}
    Log To Console    urlUpdateThingsToWorkers is : ${urlUpdateThingsToWorkers}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_UPDATETHINGSTOWORKERS}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_UPDATETHINGSTOWORKERS}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {"ThingSecret":"${ThingSecret}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Put Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${urlUpdateThingsToWorkers}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${UPDATETHINGSTOWORKERS}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    #ThingInfo
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
    # Log To Console    ThingInfo is : ${ThingInfo}	

	${GetResponse_ThingId}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGID}  
	${GetResponse_WorkerId}=    Get From Dictionary    ${ThingInfo}     ${FIELD_WORKERID}    
	${GetResponse_ConnectivityType}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CONNECTIVITYTYPE}   
	${GetResponse_ThingName}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGNAME}     
	${GetResponse_ThingIdentifier}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGIDENTIFIER}   
	${GetResponse_ThingSecret}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSECRET}   
	${GetResponse_IMEI}=    Get From Dictionary    ${ThingInfo}     ${FIELD_IMEI}   
	${GetResponse_ThingState}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSTATE}   
	${GetResponse_CustomDetails}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CUSTOMDETAILS}   
	${GetResponse_SupplierDetail}=    Get From Dictionary    ${ThingInfo}     ${FIELD_SUPPLIERDETAILS}   
	${GetResponse_SupplierId}=    Get From Dictionary    ${GetResponse_SupplierDetail}     ${FIELD_SUPPLIERID}   
	${GetResponse_SupplierName}=    Get From Dictionary    ${GetResponse_SupplierDetail}     ${FIELD_SUPPLIERNAME}   
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingId}    ${ThingId}    
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerId}    ${WorkerId2}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ConnectivityType}    ${ConnectivityType}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingName}    ${ThingName}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingIdentifier}    ${ThingIdentifier}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingSecret}    ${ThingSecret}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_IMEI}    ${IMEI}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingState}    ${ThingState}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_CustomDetails}    ${CustomDetails}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierId}    ${SupplierId}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierName}    ${SupplierName}

    #====== Start Prepare data : Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${urlUpdateThingsToWorkers}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_UPDATETHINGSTOWORKERS}${current_timestamp}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.ThingsCollection","db.ThingsCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:InquiryThing was Success"}, { "no":"3", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:UpdateThing was Success"}]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:InquiryThing was Success"}, { "no":"3", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:UpdateThing was Success"}]}     	 
	${responseObjectDetail}=    Set Variable    null

	${bodyLog}=    Set Variable    {"ThingSecret":"${ThingSecret}"}
    ${responseLog}=    Set Variable    {"ThingInfo":{"ThingId":"${ThingId}","WorkerId":"${WorkerId2}","ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","ThingState":"${ThingState}","CustomDetails":${CustomDetails},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}}    
	
    ${bodyDB}=    Evaluate    {"ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","CustomDetails":${CustomDetails},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}

    #====== End Prepare data : Check log and Verify DB ==========

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log UpdateThingsToWorkers Success    ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}

    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data Things    ${UPDATETHINGSTOWORKERS}    ${ThingName}    ${bodyDB}    ${thingId}    ${workerId2}

    [Teardown]    Generic Test Case Teardown    ${UPDATETHINGSTOWORKERS}    ${thingIdArr}    ${workerIdArr}