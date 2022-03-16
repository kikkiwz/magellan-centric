*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
MappingIMEI_TST_F2_0_4_001_Error_ConnectivityTypeInvalid
    [Documentation]    Step is :    
	...    1.Import Thing
	...    2.Mapping IMEI
	...    3.Delete a Thing
	#====== Start Prepare data ==========
    ${prepare_data}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1
    ${data}=    Set Variable    ${prepare_data}[0]    
    ${Getdata}=    Set Variable    ${data}[0] 
    ${ThingIdentifier_import}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingName_import}=    Set Variable    ${Getdata['ThingName']}
    ${ThingSecret_import}=    Set Variable    ${Getdata['ThingSecret']}
    ${ConnectivityType_import}=    Set Variable    ${Getdata['ConnectivityType']}
	${data_import}=    Evaluate    [{ "ConnectivityType": "${ConnectivityType_import}", "ThingName": "${ThingName_import}", "ThingIdentifier": "${ThingIdentifier_import}", "ThingSecret": "${ThingSecret_import}"}]
    # Import Thing
	${postImportThing}=	   Import Thing    ${URL_CENTRIC}    null    ${data_import}
    Log To Console    postImportThing${postImportThing}  
	${data_response}=    Set Variable    ${postImportThing}[0]
	Log    ${data_response}  
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${random_imei}=    generate random string    20    [NUMBERS]
    ${IMEI}=    Set Variable    ${random_imei}
	${ConnectivityType}=    Set Variable    Test

    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"ConnectivityType": "${ConnectivityType}","ThingName": "${ThingName_import}","ThingIdentifier": "${ThingIdentifier_import}","ThingSecret": "${ThingSecret_import}","IMEI": "${IMEI}"}]
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_MAPPINGIMEI}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
	
    #GetResponse_Details
	${responseObjectDetail}=    Set Variable    {'Target': '[0].ConnectivityType', 'DeveloperMessage': 'Error converting value "${ConnectivityType}" to type \\'System.Nullable`1[Centric_MongoDBService.Enum.Thing.ConnectivityType]\\'. Path \\'[0].ConnectivityType\\', line 1, position 28.'}
    ${GetResponse_OperationStatus}=    Get From Dictionary    ${res}     ${FIELD_OPERATIONSTATUS}   
    ${GetResponse_Details}=    Get From Dictionary    ${GetResponse_OperationStatus}    ${FIELD_DETAILS}   
    ${GetResponse_Details_str}    Convert To String    ${GetResponse_Details}[0]
    Log    ${GetResponse_Details_str}
    Log    ${responseObjectDetail}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Details_str}    ${responseObjectDetail}

    ${pathUrl}=    Set Variable    ${URL_MAPPINGIMEI}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}${current_timestamp}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    [{"Target":"[0].ConnectivityType","DeveloperMessage":"Error converting value \\"${ConnectivityType}\\" to type 'System.Nullable`1[Centric_MongoDBService.Enum.Thing.ConnectivityType]'. Path '[0].ConnectivityType', line 1, position 28."}]
	${bodyLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName_import}","ThingIdentifier":"${ThingIdentifier_import}","ThingSecret":"${ThingSecret_import}","IMEI":"${IMEI}"}]		

	#====== Check log and Verify DB ==========

	#Check log detail and summary
    Log MappingIMEI Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}         
   
	Connect To Mongodb    ${CONNECT_TO_MONGODB}
	${json_data}=    Set Variable    {"ThingIdentifier":"${ThingIdentifier_import}"}
    ${result_thing}=    Search All Fields    ${json_data}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
	${ThingId}=    Get From Dictionary    ${result_thing}    _id
	${ThingId_Str}=    Convert To String    ${ThingId}	
    Disconnect From Mongodb	
	${thingArr}=    Create List    ${ThingId}
    [Teardown]    Generic Test Case Teardown    ${MAPPINGIMEI}    ${EMPTY}    ${thingArr}


