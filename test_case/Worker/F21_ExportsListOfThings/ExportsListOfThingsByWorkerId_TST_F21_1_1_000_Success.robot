*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
ExportsListOfThingsByWorkerId_TST_F21_1_1_000_Success
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

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_EXPORTSLISTOFTHINGBYWORKERID}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${urlExportsListOfThingsByWorkerId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${EXPORTSLISTOFTHINGBYWORKERID}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

	#ThingInfo
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
    # Log To Console    ThingInfo is : ${ThingInfo}	

    @{valArrThingId}=    Create List
    ${data_countThingInfo}=    Get Length    ${ThingInfo}
	# Log To Console    data_countThingInfo${data_countThingInfo}  
	FOR    ${i}    IN RANGE    ${data_countThingInfo}
        Append To List    ${valArrThingId}    ${ThingInfo[${i}]['${FIELD_THINGID}']}        #Add data to array set at valArrData         
    #Exit For Loop
	END
	Log To Console    valArrThingId is : ${valArrThingId}	

	${CreatedDatetime}=    Replace String    ${ThingInfo[${i}]['CreatedDatetime']}    +07:00    Z   
	${LastUpdatedTimestamp}=    Replace String    ${ThingInfo[${i}]['LastUpdatedTimestamp']}    +07:00    Z    

    #====== Start Prepare data : Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${urlExportsListOfThingsByWorkerId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID}${current_timestamp}

	# ${bodyLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret1}","IMEI":"${IMEI1}","CustomDetails":${CustomDetails1},"SupplierDetail":{"SupplierId":"${SupplierId1}","SupplierName":"${SupplierName1}"}}]		
    ${responseLog}=    Set Variable    {"ThingInfo":[{"ThingId":"${valArrThingId}[0]","WorkerId":"${WorkerId}","ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","ThingState":"${ThingState}","CustomDetails":${CustomDetails},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"},"CreatedDatetime":"${CreatedDatetime}","LastUpdatedTimestamp":"${LastUpdatedTimestamp}"}],"@Metadata":{"CurrentPage":1,"TotalPages":1,"Top":10,"TotalCount":1,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"${VALUE_LOG_CODE_20000}","DeveloperMessage":"${VALUE_DESCRIPTION_EXPORTSLISTOFTHINGBYWORKERID_SUCCESS}"}}    
    # ${responseLog}=    Evaluate    {'ThingInfo':[{'ThingId':'${valArrThingId}[0]','WorkerId':'${WorkerId}','ConnectivityType':'${ConnectivityType}','ThingName':'${ThingName}','ThingIdentifier':'${ThingIdentifier}','ThingSecret':'${ThingSecret}','IMEI':'${IMEI}','ThingState':'${ThingState}','CustomDetails':${CustomDetails},'SupplierDetail':{'SupplierId':'${SupplierId}','SupplierName':'${SupplierName}'},'CreatedDatetime':'${CreatedDatetime}','LastUpdatedTimestamp':'${LastUpdatedTimestamp}'}],'@Metadata':{'CurrentPage':1,'TotalPages':1,'Top':10,'TotalCount':1,'HasPrevious':false,'HasNext':false},'OperationStatus':{'Code':'${VALUE_LOG_CODE_20000}','DeveloperMessage':'${VALUE_DESCRIPTION_EXPORTSLISTOFTHINGBYWORKERID_SUCCESS}'}}    
    
	${bodyDB}=    Evaluate    [{"ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","CustomDetails":${CustomDetails},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}]		

    #====== End Prepare data : Check log and Verify DB ==========

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log ExportsListOfThingsByWorkerId Success    ${responseLog}    ${pathUrl}    ${dataSearch}

    #Inquiry for verify DB   
    ${count}=    Get Length    ${bodyDB}
	# Log To Console    count is : ${count}
	FOR    ${i}    IN RANGE    ${count}
        Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data Things    ${EXPORTSLISTOFTHINGBYWORKERID}    ${ThingName}    ${bodyDB}[${i}]    ${valArrThingId}[${i}]    ${WorkerId}
    END

	[Teardown]    Generic Test Case Teardown    ${EXPORTSLISTOFTHINGBYWORKERID}    ${valArrThingId}    ${WorkerId}
    