*** Keywords ***
    # Connect To Mongodb    mongodb://admin:ais.co.th@52.163.210.190:27018/mgcore?authSource=admin

Request Verify DB Check Data Whitelist
    [Arguments]      ${body}    ${OwnerType}    ${CustomerId}    ${AccountId}    ${ThingIdentifier}

	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_WHITELISTDEVICE}
    Log To Console    result Request Verify DB Check Data CreateWhitelist: ${result}

	${RemoveStatus}=    Set Variable    False

	${ObjectId}=    Set Variable    ${result['_id']}

	Log To Console    ObjectId : : :${ObjectId}    

	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}

    ${replaceWhitelistId}=    Replace String    ${VALUE_DB_CENTRICS_WHITELIST}    [WhitelistId]    '${ObjectId}'
	${replaceRemoveStatus}=    Replace String    ${replaceWhitelistId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceOwnerType}=    Replace String    ${replaceLastUpdatedTimestamp}    [OwnerType]    ${OwnerType}
	${replaceOwnerId}=    Replace String    ${replaceOwnerType}    [OwnerId]    ${CustomerId}
	${replaceThingIdentifier}=    Replace String    ${replaceOwnerId}    [ThingIdentifier]    ${ThingIdentifier}
	${resultDB}=    Replace String To Object    ${replaceThingIdentifier}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB CreateWhitelist	

Request Verify DB Check Data UpdateWhitelist
    [Arguments]      ${body}    ${WhitelistId}    ${OwnerType}    ${CustomerId}    ${AccountId}    ${ThingIdentifier}

	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_WHITELISTDEVICE}
    Log To Console    result Request Verify DB Check Data UpdateWhitelist: ${result}

	${RemoveStatus}=    Set Variable    False

	# # 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# # Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# # Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}

    ${replaceWhitelistId}=    Replace String    ${VALUE_DB_CENTRICS_WHITELIST}    [WhitelistId]    '${WhitelistId}'
	${replaceRemoveStatus}=    Replace String    ${replaceWhitelistId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceOwnerType}=    Replace String    ${replaceLastUpdatedTimestamp}    [OwnerType]    ${OwnerType}
	${replaceOwnerId}=    Replace String    ${replaceOwnerType}    [OwnerId]    ${CustomerId}
	${replaceThingIdentifier}=    Replace String    ${replaceOwnerId}    [ThingIdentifier]    ${ThingIdentifier}
	${resultDB}=    Replace String To Object    ${replaceThingIdentifier}
	Log To Console    resultDB Request Verify DB Check Data UpdateWhitelist : ${resultDB}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB UpdateWhitelist

Request Verify DB Check Data GetAWhitelistByThingidentifier
    [Arguments]      ${body}    ${OwnerType}    ${CustomerId}    ${AccountId}    ${ThingIdentifier}

	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_WHITELISTDEVICE}
    Log To Console    result Request Verify DB Check Data GetAWhitelistByThingidentifier: ${result}

	${RemoveStatus}=    Set Variable    False

	${ObjectId}=    Set Variable    ${result['_id']}

	Log To Console    ObjectId : : :${ObjectId}    

	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}

    ${replaceWhitelistId}=    Replace String    ${VALUE_DB_CENTRICS_WHITELIST}    [WhitelistId]    '${ObjectId}'
	${replaceRemoveStatus}=    Replace String    ${replaceWhitelistId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceOwnerType}=    Replace String    ${replaceLastUpdatedTimestamp}    [OwnerType]    ${OwnerType}
	${replaceOwnerId}=    Replace String    ${replaceOwnerType}    [OwnerId]    ${CustomerId}
	${replaceThingIdentifier}=    Replace String    ${replaceOwnerId}    [ThingIdentifier]    ${ThingIdentifier}
	${resultDB}=    Replace String To Object    ${replaceThingIdentifier}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB GetAWhitelistByThingidentifier	

Request Verify DB Check Data Workers
    [Arguments]      ${flow}    ${WorkerName}    ${body}    ${WorkerId}

	${data}=    Set Variable    {"WorkerName" : "${WorkerName}"}

	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_WORKERS}
    Log To Console    result Request Verify DB Check Data HouseKeepers: ${result}

	${RemoveStatus}=    Set Variable If    '${flow}'=='${DELETEAWORKER}'    True
	...    '${flow}'!='${DELETEAWORKER}'    False
    # Log To Console    ${RemoveStatus}

	${WorkerState}=    Set Variable    ${body['WorkerState']}
	${ServerProperties}=    Set Variable    ${body['ServerProperties']}
	${ServerIP}=    Set Variable    ${ServerProperties['ServerIP']}
	${ServerPort}=    Convert To String    ${ServerProperties['ServerPort']}
	${ServerDomain}=    Convert To String    ${ServerProperties['ServerDomain']}

	# ${Resource}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    {'CustomerId': ObjectId('${BindingKey}'), 'TenantId': None, 'AccountId': None}
 
	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}

    ${replaceWorkerId}=    Replace String    ${VALUE_DB_CENTRICS_WORKER}    [WorkerId]    ${WorkerId}
	${replaceRemoveStatus}=    Replace String    ${replaceWorkerId}    [RemoveStatus]    ${RemoveStatus}
	${replaceWorkerName}=    Replace String    ${replaceRemoveStatus}    [WorkerName]    ${WorkerName}
	${replaceWorkerState}=    Replace String    ${replaceWorkerName}    [WorkerState]    ${WorkerState}
	${replaceServerIP}=    Replace String    ${replaceWorkerState}    [ServerIP]    ${ServerIP}
	${replaceServerPort}=    Replace String    ${replaceServerIP}    [ServerPort]    ${ServerPort}
	${replaceServerDomain}=    Replace String    ${replaceServerPort}    [ServerDomain]    ${ServerDomain}
	${replaceCreatedDateTime}=    Replace String    ${replaceServerDomain}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${resultDB}=    Replace String To Object    ${replaceLastUpdatedTimestamp}
	Log To Console    resultDB Request Verify DB Check Data Workers : ${resultDB}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB Workers	

Request Verify DB Check Data Things
    [Arguments]      ${flow}    ${ThingName}    ${body}    ${ThingId}    ${WorkerId}

	${data}=    Set Variable    {"ThingName" : "${ThingName}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
    Log To Console    Request Verify DB Check Data Things: ${result}

	${RemoveStatus}=    Set Variable If    '${flow}'=='${REMOVEATHING}'    True
	...    '${flow}'!='${REMOVEATHING}'    False
    # Log To Console    ${RemoveStatus}

    ${ConnectivityType}=    Set Variable    ${body['ConnectivityType']}
	${ThingIdentifier}=    Set Variable    ${body['ThingIdentifier']}
	${ThingSecret}=    Set Variable    ${body['ThingSecret']}
	${IMEI}=    Set Variable    ${body['IMEI']}
	${SupplierDetail}=    Set Variable    ${body['SupplierDetail']}
	${SupplierId}=    Set Variable    ${SupplierDetail['SupplierId']}
	${SupplierName}=    Set Variable    ${SupplierDetail['SupplierName']}

	${ThingState}=    Set Variable If    '${flow}'!='${DELETETHINGSFROMWORKER}'    ${VALUE_THINGSTATE_IDLE}
	...    '${flow}'=='${DELETETHINGSFROMWORKER}'    ${VALUE_THINGSTATE_PENDING}

	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}

    ${valueReplace}=    Set Variable If    '${flow}'!='${DELETETHINGSFROMWORKER}'    ${VALUE_DB_CENTRICS_THINGS}
	...    '${flow}'=='${DELETETHINGSFROMWORKER}'    ${VALUE_DB_CENTRICS_THINGS_NOWORKERID}


    ${replaceThingId}=    Replace String    ${valueReplace}    [ThingId]    ${ThingId}
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${resultDB}=    Replace String To Object    ${replaceSupplierName}
	${resultDB}=    Replace String    ${resultDB}    ''    None
	${strResult}=    Convert To String    ${result}
	
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB GetAWhitelistByThingidentifier	


Request Verify DB Check Data VerifiesThings
    [Arguments]    ${ThingId}    ${WorkerId}    ${ConnectivityType}    ${ThingName}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ThingState}    ${SupplierId}    ${SupplierName}
    Log    ${ThingId} 
	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
    Log To Console    Request Verify DB Check Data VerifiesThings: ${result}
    Log    ${result}
	${RemoveStatus}=    Set Variable    False
  

	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}
    ${value_db}=    Set Variable If    '${SupplierId}'=='None'    ${VALUE_DB_CENTRICS_VERIFIESTHINGS_HAVESUPPIRERNONE}
	...    ${VALUE_DB_CENTRICS_VERIFIESTHINGS}
    ${replaceThingId}=    Replace String    ${value_db}    [ThingId]    ${ThingId}
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${resultDB}=    Replace String To Object    ${replaceSupplierName}
	${strResult}=    Convert To String    ${result}
	Log    Expect is : ${strResult}
	Log    Actual is : ${resultDB}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB VerifiesThings	



Request Verify DB Check Data ActivateThings
    [Arguments]    ${ThingId}    ${WorkerId}    ${ConnectivityType}    ${ThingName}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${SupplierId}    ${SupplierName}

	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
    Log To Console    Request Verify DB Check Data ActivateThings: ${result}

	${RemoveStatus}=    Set Variable    False
	${ThingState}=    Set Variable    Activated
  

	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}

    ${replaceThingId}=    Replace String    ${VALUE_DB_CENTRICS_VERIFIESTHINGS}    [ThingId]    ${ThingId}
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${resultDB}=    Replace String To Object    ${replaceSupplierName}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB ActivateThings	

Request Verify DB Check Things
    [Arguments]    ${ThingId}    ${WorkerId}    ${ConnectivityType}    ${ThingName}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ThingState}    ${SupplierId}    ${SupplierName}    ${CustomDetails_Key}    ${CustomDetails_Value}

	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
    Log To Console    Request Verify DB Check Data VerifiesThings: ${result}

	${RemoveStatus}=    Set Variable    False
  
	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}
    ${value_db}=    Set Variable If    
	...    '${WorkerId}'=='None' and '${CustomDetails_Key}'=='None' and '${SupplierId}'!='None' and '${SupplierName}'!='None'    ${VALUE_DB_CENTRICS_VERIFIESTHINGS_HAVECUSTOMERDETAIL_NOTHAVEWORKER_HAVESUPPIRERNONE}
	...    '${WorkerId}'=='None' and '${CustomDetails_Key}'=='None' and '${SupplierId}'=='None' and '${SupplierName}'=='None'     ${VALUE_DB_CENTRICS_VERIFIESTHINGS_NOTHAVECUSTOMERDETAIL_NOTHAVESUPPIRERNONE_NOTHAVEWORKER} 
	...    '${WorkerId}'=='None' and '${CustomDetails_Key}'!='None' and '${SupplierId}'!='None' and '${SupplierName}'!='None'     ${VALUE_DB_CENTRICS_VERIFIESTHINGS_HAVECUSTOMERDETAIL_HAVEWORKER} 
	...    '${WorkerId}'=='None2' and '${CustomDetails_Key}'=='None' and '${SupplierId}'=='None' and '${SupplierName}'=='None'     ${VALUE_DB_CENTRICS_VERIFIESTHINGS_NOTHAVECUSTOMERDETAIL_NOTHAVESUPPIRERNONE_NOTHAVEWORKER2} 

	...    '${WorkerId}'!='None' and '${CustomDetails_Key}'!='None' and '${SupplierId}'!='None' and '${SupplierName}'!='None'    ${VALUE_DB_CENTRICS_VERIFIESTHINGS_HAVECUSTOMERDETAIL} 
	...    ${VALUE_DB_CENTRICS_VERIFIESTHINGS}
	Log    ${value_db}
	Log    ${WorkerId}
    ${replaceThingId}=    Replace String    ${value_db}    [ThingId]    ${ThingId}
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	Log    ${replaceWorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${replaceCustomerDetailKey}=    Replace String    ${replaceSupplierName}    [CustomerDetailKey]    ${CustomDetails_Key}
	${replaceCustomerDetailValue}=    Replace String    ${replaceCustomerDetailKey}    [CustomerDetailValue]    ${CustomDetails_Value}
	${resultDB}=    Replace String To Object    ${replaceCustomerDetailValue}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB Things	


Request Verify DB Check Data TerminatesThings
    [Arguments]    ${ThingId}    ${WorkerId}    ${ConnectivityType}    ${ThingName}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${SupplierId}    ${SupplierName}
	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}

    Log To Console    Request Verify DB Check Data TerminatesThings: ${result}

	${RemoveStatus}=    Set Variable    False
	${ThingState}=    Set Variable    Idle

  	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}


    ${replaceThingId}=    Replace String    ${VALUE_DB_CENTRICS_TERMINATESTHINGS}    [ThingId]    ${ThingId}
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${resultDB}=    Replace String To Object    ${replaceSupplierName}
	${strResult}=    Convert To String    ${result}

	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB TerminatesThings



Request Verify DB Check Data ImportThing
    [Arguments]    ${body}    ${ThingName}

	${data}=    Set Variable    {"ThingName" : "${ThingName}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
    Log To Console    Request Verify DB Check Data ImportThing: ${result}



	${ConnectivityType}=    Set Variable    ${body['ConnectivityType']}
	${ThingIdentifier}=    Set Variable    ${body['ThingIdentifier']}
	${ThingSecret}=    Set Variable    ${body['ThingSecret']}
	${IMEI}=    Set Variable    ${body['IMEI']}
	${SupplierDetail}=    Set Variable    ${body['SupplierDetail']}
	${SupplierId}=    Set Variable    ${SupplierDetail['SupplierId']}
	${SupplierName}=    Set Variable    ${SupplierDetail['SupplierName']}
	${RemoveStatus}=    Set Variable    False
	${ThingState}=    Set Variable    Manufacturing
	${ThingId}=    Set Variable    ${result['_id']}
	Log To Console    ThingId${ThingId}    
	${WorkerId}=    Set Variable    None

  	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}


    ${replaceThingId}=    Replace String    ${VALUE_DB_CENTRICS_IMPORTTHING}    [ThingId]    '${ThingId}'
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${EMPTY}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${resultDB}=    Replace String To Object    ${replaceSupplierName}
	${strResult}=    Convert To String    ${result}

	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB ImportThing


Request Verify DB Check Data DeleteThing Success Check Nofound
    [Arguments]    ${ThingId}    ${WorkerId}    ${ConnectivityType}    ${ThingName}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ThingState}    ${SupplierId}    ${SupplierName}

	${data}=    Set Variable    {"ThingIdentifier" : "${ThingIdentifier}"}
	${value_fields}=    Set Variable    null
    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
    Log To Console    Request Verify DB Check Data VerifiesThings: ${result}

	${RemoveStatus}=    Set Variable    True
    # 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000 
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}

    ${replaceThingId}=    Replace String    ${VALUE_DB_CENTRICS_VERIFIESTHINGS_HAVECUSTOMERDETAIL_NOTHAVEWORKER_HAVESUPPIRERNONE}    [ThingId]    ${ThingId}
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${resultDB}=    Replace String To Object    ${replaceSupplierName}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB DeleteThing Case Not Found	


Request Verify DB Check Data ImportThingBySupplier
    [Arguments]    ${body}    ${ThingName}    ${index}

	${data}=    Set Variable    {"ThingName" : "${ThingName}"}
	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
    Log    Request Verify DB Check Data ImportThing: ${result}



	${ConnectivityType}=    Set Variable    ${body['ConnectivityType']}
	${ThingIdentifier}=    Set Variable    ${body['ThingIdentifier']}
	${ThingSecret}=    Set Variable    ${body['ThingSecret']}
	${IMEI}=    Set Variable    ${body['IMEI']}
	${SupplierDetail}=    Set Variable    ${body['SupplierDetail']}
	${SupplierId}=    Set Variable    ${SupplierDetail['SupplierId']}
	${RemoveStatus}=    Set Variable    False
	${ThingState}=    Set Variable If    "${IMEI}"=="${EMPTY}"    Manufacturing
	...    Pending
	${ThingId}=    Set Variable    ${result['_id']}
	Log To Console    ThingId${ThingId}    
	${WorkerId}=    Set Variable    None

  	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}


    ${replaceThingId}=    Replace String    ${VALUE_DB_CENTRICS_IMPORTTHINGBYSUPPLIER}    [ThingId]    '${ThingId}'
	${replaceRemoveStatus}=    Replace String    ${replaceThingId}    [RemoveStatus]    ${RemoveStatus}
	${replaceCreatedDateTime}=    Replace String    ${replaceRemoveStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${replaceWorkerId}=    Replace String    ${replaceLastUpdatedTimestamp}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	#${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${resultDB}=    Replace String To Object    ${replaceSupplierId}
	${strResult}=    Convert To String    ${result}

	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB ImportThing