*** Settings ***
Library    Collections
Library    String
Library    DateTime
Library    OperatingSystem
Library    Process
Library    BuiltIn
Library    JSONLibrary
Library    MongoDBLibrary

Resource    ../keyword/Keyword_Request.robot
Resource    ../keyword/Keyword_Datetime.robot
Resource    ../keyword/Keyword_CreateData.robot
Resource    ../keyword/Keyword_RemoveData.robot
Resource    ../keyword/Keyword_UpdateData.robot
Resource    ../keyword/Keyword_InquiryData.robot
Resource    ../keyword/Keyword_Log.robot
Resource    ../keyword/Keyword_Log_Summary.robot

Resource    ../keyword/Keyword_MongoDB.robot
Resource    ../keyword/Keyword_VerifyDB.robot

Resource    ../keyword/Keyword_Log_Detail.robot
Resource    ../keyword/Keyword_Log_Detail_Centric.robot
Resource    ../keyword/Keyword_Centric_RemoveData.robot

Resource    ../keyword/Keyword_VerifyLog_Whitelist.robot
Resource    ../keyword/Keyword_VerifyLog_Worker.robot
Resource    ../keyword/Keyword_VerifyLog_Supplier.robot
Resource    ../keyword/Keyword_VerifyLog_Capability.robot
Resource    ../keyword/Keyword_VerifyLog_Thing.robot

#Library Document
#https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
#https://robotframework.org/robotframework/latest/libraries/String.html
#https://robotframework.org/robotframework/latest/libraries/Collections.html
#https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html

*** Keywords ***
####################################################
Add Needed Image Path
    Add Image Path    ${IMAGE_DIR}
	
Replace Text
    [Arguments]    ${string}    ${search_for}    ${replace_with}
	
	${replaceUrl}=    Replace String    ${string}    ${search_for}    ${replace_with}
	Log To Console    ${text}
	[RETURN]    ${text}
	
Replace Parameters Url Path
	[Arguments]    ${url}    ${urlPath}    ${ParametersField}    ${value_ParametersField}    ${ParametersField_ipAddress}    ${value_ipAddress}
	${replaceParametersUrl}=    Replace String    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	#Log To Console    replaceUrl${replaceParametersUrl}
    ${replaceIPAddressUrl}=    Replace String    ${replaceParametersUrl}    ${ParametersField_ipAddress}    ${value_ipAddress}
	#Log To Console    replaceUrl${replaceIPAddressUrl}
	${url}=    Set Variable    ${url}${replaceIPAddressUrl}
	#Log To Console    ${url}
	[return]    ${url}
	
Replace Parameters Path
	[Arguments]    ${urlPath}    ${ParametersField}    ${value_ParametersField}    ${ParametersField_ipAddress}    ${value_ipAddress}
	${replaceParametersUrl}=    Replace String    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	#Log To Console    replaceUrl${replaceParametersUrl}
    ${replaceIPAddressUrl}=    Replace String    ${replaceParametersUrl}    ${ParametersField_ipAddress}    ${value_ipAddress}
	#Log To Console    replaceUrl${replaceIPAddressUrl}
	${path}=    Set Variable    ${replaceIPAddressUrl}
	#Log To Console    ${path}
	[return]    ${path}	

Replace Parameters
	[Arguments]    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	${replaceParametersUrl}=    Replace String    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	#Log To Console    replaceUrl${replaceParametersUrl}
	${path}=    Set Variable    ${replaceParametersUrl}
	#Log To Console    ${path}
	[return]    ${path}	
	
#for use check log and verify DB check data 
Check Json Data Should Be Equal
	[Arguments]    ${JsonData}    ${field}    ${expected}    ${fieldName}

	#json.dumps use for parameter convert ' to "
	${listAsString}=    Evaluate    json.dumps(${JsonData})    json
	#r use for parameter / have in data
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
	#Log To Console    resp_json${resp_json}	
    #Should Be Equal    ${resp_json['${field}']}    ${expected}
	#Log To Console    resp_json${resp_json${field}}
	Log Many    ${listAsString}	
	Log To Console    ${fieldName} : ${expected} = ${resp_json${field}}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected}    ${resp_json${field}}    error=${field}	

Teardown Message
    [Arguments]    ${message}
    Log    Failed!!!	
  

Generic Test Case Teardown
    [Arguments]    ${Flow}    ${getData}    ${id}

	Log To Console    Flow${Flow}    
  
    # Catch of Try Catch Finally
    Run Keyword If Test Failed    Test Case Catch 
    # Finally of Try Catch Finally
    #  RKITS is only executed when test passed.
    Run Keyword If Test Passed    Test Case Finally
    Run Keyword If	'${Flow}' == '${CREATEPARTNER}'    Rollback Data Create Partner    ${getData}    ${id}
	Run Keyword If	'${Flow}' == '${RETURNSALISTOFWHITELIST}' or '${Flow}' == '${PARTNERACCOUNTATHING}'    Rollback Data Remove Partner Account and AThing    ${Flow}    ${getData}
    Run Keyword If	'${Flow}' == '${UPDATEAWHITELIST}' or '${Flow}' == '${CREATEAWHITELIST}' or '${Flow}' == '${GETAWHITELISTBYTHINGIDENTIFIER}'     Rollback Data Remove Partner Account AThing and Whitelist    ${getData}    ${id}
    Run Keyword If	'${Flow}' == '${CREATEAWORKER}' or '${Flow}' == '${UPDATEAWORKER}' or '${Flow}' == '${PARTIALUPDATEAWORKER}' or '${Flow}' == '${DELETEAWORKER}' or '${Flow}' == '${GETAWORKERBYWORKERID}' or '${Flow}' == '${RETURNSALISTOFWORKER}' or '${Flow}' == '${WORKER}' or '${Flow}' == '${TERMINATESTHINGSDELETEWORKERONLY}'    Rollback Data DeleteAWorker    ${Flow}    ${id}
	Run Keyword If	'${Flow}' == '${UPDATEAWORKER2}' or '${Flow}' == '${UPDATETHINGSTOWORKERS2}'    Rollback Data DeleteAWorker2    ${Flow}    ${id}
    Run Keyword If	'${Flow}' == '${VERIFIESTHINGS}' or '${Flow}' == '${CREATEATHINGHAVEWORKER}' or '${Flow}' == '${ACTIVATETHINGS}' or '${Flow}'=='${GETTHINGBYTHINGIDHAVEWORKER}' or '${Flow}' == '${UPDATEATHINGHAVEWORKER}' or '${Flow}'=='${TERMINATESTHINGS}' or '${Flow}' == '${PARTIALUPDATEATHINGHAVEWORKER}'    Rollback Data Delete Worker and AThing    ${Flow}    ${getData}
    Run Keyword If	'${Flow}' == '${VERIFIESTHINGS2DATA}' or '${Flow}' == '${ACTIVATETHINGS2DATA}' or '${Flow}' == '${RETURNSALISTOFTHINGS}' or '${Flow}' == '${TERMINATESTHINGS2DATA}'    Rollback Data Delete Worker and AThing2DATA    ${Flow}    ${getData}
    Run Keyword If	'${Flow}' == '${IMPORTSLISTOFTHINGBYWORKERID}' or '${Flow}' == '${EXPORTSLISTOFTHINGBYWORKERID}' or '${Flow}' == '${ASSIGNTHINGSTOWORKERS}'    Rollback Data DeleteAWorker and DeleteAThingArr    ${Flow}    ${getData}    ${id}
    Run Keyword If	'${Flow}' == '${CREATEATHINGNOTHAVEWORKER}' or '${Flow}' == '${RETURNSALISTOFTHING}' or '${Flow}'=='${GETTHINGBYTHINGIDNOTHAVEWORKER}' or '${Flow}' == '${UPDATEATHINGNOTHAVEWORKER}' or '${Flow}' == '${PARTIALUPDATEATHINGNOTHAVEWORKER}' or '${Flow}' == '${THINGRETURNSALISTOFTHING}'   Rollback Data Delete AThing    ${Flow}    ${id}
    Run Keyword If	'${Flow}' == '${VERIFIESTHINGSNOTDELETEWORKER}' or '${Flow}' == '${ACTIVATETHINGSNOTDELETEWORKER}' or '${Flow}' == '${THINHG}' or '${Flow}' == '${TERMINATESTHINGSNOTDELETEWORKER}'    Rollback Data Delete AThing Only    ${Flow}    ${getData}
    Run Keyword If	'${Flow}' == '${MAPPINGIMEI}' or '${Flow}' == '${IMPORTTHING}'or '${Flow}' == '${IMPORTTHINGBYSUPPLIER}'    Rollback Data DeleteAThingArr    ${Flow}    ${id}
    Run Keyword If	'${Flow}' == '${UPDATETHINGSTOWORKERS}' or '${Flow}' == '${DELETETHINGSFROMWORKER}'    Rollback Data DeleteAWorkerArr and DeleteAThingArr    ${Flow}    ${getData}    ${id}
    Run Keyword If	'${Flow}' == '${PARTNERACCOUNTATHINGARRAY}'    Rollback Data Remove Partner Account and AThing Array    ${Flow}    ${getData}

Test Case Catch
    Log To Console    Test Case Catch : Rollback!!
 
	 
Test Case Finally
    Log To Console    Test Case Finally

Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore
    [Arguments]    ${num}
    
	${data_count}=    Set Variable    ${num}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        #set IMEI
        ${randomIM1}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIM2}=    Evaluate    random.randint(1000000, 9999999)    random
        ${random_IMEI}=    Set Variable    ${randomIM1}${randomIM2}
        # Log To Console    ${random_IMEI} 
        Set Global Variable    ${IMEI}    ${random_IMEI}
        Log To Console    IMEI is : ${IMEI}

        #set ThingSecret
        ${randomIM3}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIM4}=    Evaluate    random.randint(1000000, 9999999)    random
        ${random_ThingSecret}=    Set Variable    ${randomIM3}${randomIM4}
        # Log To Console    ${random_ThingSecret} 
        Set Global Variable    ${ThingSecret}    ${random_ThingSecret}
        Log To Console    ThingSecret is : ${ThingSecret}
	
        #set ThingIdentifier
        ${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
        ${random_ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
        # Log To Console    ${random_ThingIdentifier} 
        Set Global Variable    ${ThingIdentifier}    ${random_ThingIdentifier}
        Log To Console    ThingIdentifier is : ${ThingIdentifier}	

		#ThingName
        ${random_number}=    generate random string    6    [NUMBERS]
        ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
        Log To Console    ThingName is : ${ThingName}
        
        ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }

        Append To List    ${valArrData}    ${data}        #Add data to array set at valArrData

    # Exit For Loop
	END
	# Log To Console    valArrData${valArrData}
	[return]    ${valArrData}

Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist
    [Arguments]    ${num}
    
	${data_count}=    Set Variable    ${num}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
    @{valArrDataThingIdentifier}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        #set IMEI
        ${randomIM1}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIM2}=    Evaluate    random.randint(1000000, 9999999)    random
        ${random_IMEI}=    Set Variable    ${randomIM1}${randomIM2}
        # Log To Console    ${random_IMEI} 
        Set Global Variable    ${IMEI}    ${random_IMEI}
        Log To Console    IMEI is : ${IMEI}

        #set ThingSecret
        ${randomIM3}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIM4}=    Evaluate    random.randint(1000000, 9999999)    random
        ${random_ThingSecret}=    Set Variable    ${randomIM3}${randomIM4}
        # Log To Console    ${random_ThingSecret} 
        Set Global Variable    ${ThingSecret}    ${random_ThingSecret}
        Log To Console    ThingSecret is : ${ThingSecret}
	
        #set ThingIdentifier
        ${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
        ${random_ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
        # Log To Console    ${random_ThingIdentifier} 
        Set Global Variable    ${ThingIdentifier}    ${random_ThingIdentifier}
        Log To Console    ThingIdentifier is : ${ThingIdentifier}	

		#ThingName
        ${random_number}=    generate random string    6    [NUMBERS]
        ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
        Log To Console    ThingName is : ${ThingName}
        
        ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }

        Append To List    ${valArrData}    ${data}        #Add data to array set at valArrData
        Append To List    ${valArrDataThingIdentifier}    ${ThingIdentifier}        #Add data to array set at valArrData

    # Exit For Loop
	END
	# Log To Console    valArrData${valArrData}
    # Log To Console    valArrDataThingIdentifier${valArrDataThingIdentifier}
    [return]    ${valArrData}    ${valArrDataThingIdentifier}



Prepare data for Create A Thing for Import
    [Arguments]    ${num}    ${ConnectivityType}    ${ThingState}    ${CustomDetails}

    ${data_count}=    Set Variable    ${num}
    # Log To Console    ${data_count}
    @{valArrData}=    Create List
    FOR    ${i}    IN RANGE    ${data_count}

        #set IMEI (20 digit)
        ${randomIMEI1}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIMEI2}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomIMEI3}=    Evaluate    random.randint(10000, 99999)    random
        ${IMEI}=    Set Variable    ${randomIMEI1}${randomIMEI2}${randomIMEI3}
        Log To Console    IMEI is : ${IMEI}

        #set ThingSecret (20 digit)
        ${randomIMSI1}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIMSI2}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomIMSI3}=    Evaluate    random.randint(10000, 99999)    random
        ${ThingSecret}=    Set Variable    ${randomIMSI1}${randomIMSI2}${randomIMSI3}
        Log To Console    ThingSecret is : ${ThingSecret}

        #set ThingIdentifier (19 digit : 896603 + 13 digit)
        ${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
        ${ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
        Log To Console    ThingIdentifier is : ${ThingIdentifier}	

        #ThingName
        ${random_number}=    generate random string    8    [NUMBERS]
        ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
        Log To Console    ThingName is : ${ThingName}

        ${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}
        Log To Console    SupplierId is : ${SupplierId}
        ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}
        Log To Console    SupplierName is : ${SupplierName}
        
        ${data}=    Evaluate    {"ConnectivityType":"${ConnectivityType}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}","ThingState": "${ThingState}","CustomDetails":${CustomDetails},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}

        Append To List    ${valArrData}    ${data}        #Add data to array set at valArrData

    # Exit For Loop
	END
	# Log To Console    valArrData${valArrData}
    #json.dumps use for parameter convert ' to "
    ${listAsString}=    Evaluate    json.dumps(${valArrData})    json
    # Log To Console    listAsString${listAsString}
    ${replaceArrData}=    Replace String    ${listAsString}    ${SPACE}    ${EMPTY}
    # Log To Console    replaceArrData${replaceArrData}
	[return]    ${valArrData}    ${replaceArrData}


Prepare data for Create A Thing
    [Arguments]    ${num}    ${ConnectivityType}    ${ThingState}    ${CustomDetails}

    ${data_count}=    Set Variable    ${num}
    # Log To Console    ${data_count}
    @{valArrData}=    Create List
    FOR    ${i}    IN RANGE    ${data_count}

        #set IMEI (20 digit)
        ${randomIMEI1}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIMEI2}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomIMEI3}=    Evaluate    random.randint(10000, 99999)    random
        ${IMEI}=    Set Variable    ${randomIMEI1}${randomIMEI2}${randomIMEI3}
        Log To Console    IMEI is : ${IMEI}

        #set ThingSecret (20 digit)
        ${randomIMSI1}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIMSI2}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomIMSI3}=    Evaluate    random.randint(10000, 99999)    random
        ${ThingSecret}=    Set Variable    ${randomIMSI1}${randomIMSI2}${randomIMSI3}
        Log To Console    ThingSecret is : ${ThingSecret}

        #set ThingIdentifier (19 digit : 896603 + 13 digit)
        ${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
        ${ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
        Log To Console    ThingIdentifier is : ${ThingIdentifier}	

        ${data}=    Evaluate    {"ConnectivityType":"${ConnectivityType}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}","ThingState": "${ThingState}"}

        Append To List    ${valArrData}    ${data}        #Add data to array set at valArrData

    # Exit For Loop
	END
	# Log To Console    valArrData${valArrData}
    #json.dumps use for parameter convert ' to "
    ${listAsString}=    Evaluate    json.dumps(${valArrData})    json
    # Log To Console    listAsString${listAsString}
    ${replaceArrData}=    Replace String    ${listAsString}    ${SPACE}    ${EMPTY}
    # Log To Console    replaceArrData${replaceArrData}
	[return]    ${valArrData}    ${replaceArrData}


Prepare data for create
    [Arguments]    ${num}

	${data_count}=    Set Variable    ${num}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        #set IMEI
        ${randomIM1}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomIM2}=    Evaluate    random.randint(1000000, 9999999)    random        
        ${randomIM3}=    Evaluate    random.randint(100000, 999999)    random
        ${random_IMEI}=    Set Variable    ${randomIM1}${randomIM2}${randomIM3}
        # Log To Console    ${random_IMEI} 
        Set Global Variable    ${IMEI}    ${random_IMEI}
        Log To Console    IMEI is : ${IMEI}

        #set ThingSecret
        ${randomIM3}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomIM4}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomIM5}=    Evaluate    random.randint(100000, 999999)    random
        ${random_ThingSecret}=    Set Variable    ${randomIM3}${randomIM4}${randomIM5}
        # Log To Console    ${random_ThingSecret} 
        Set Global Variable    ${ThingSecret}    ${random_ThingSecret}
        Log To Console    ThingSecret is : ${ThingSecret}
	
        #set ThingIdentifier
        ${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
        ${random_ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
        # Log To Console    ${random_ThingIdentifier} 
        Set Global Variable    ${ThingIdentifier}    ${random_ThingIdentifier}
        Log To Console    ThingIdentifier is : ${ThingIdentifier}	

		#ThingName
        ${random_number}=    generate random string    6    [NUMBERS]
        ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
        Log To Console    ThingName is : ${ThingName}
        
        ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }

        Append To List    ${valArrData}    ${data}        #Add data to array set at valArrData
		# Run Keyword If    '${valueSearch}'=='${ASGARD_COAPAPI_VALUE_TST_F4_0_2_003_DATASEARCH}'    Append To List    ${valArrData}    ${valLog}        #Add data to array set at valArrData
		
    # Exit For Loop
	END
	# Log To Console    valArrData${valArrData}
	[return]    ${valArrData}
