*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
MappingIMEI_TST_F2_1_1_001_Success_Mapping_IMEI_3_list
    [Documentation]    Step is :    
	...    1.Import Thing
	...    2.Mapping IMEI
	...    3.Delete a Thing
	#====== Start Prepare data ==========
    ${prepare_data}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    3
    ${data}=    Set Variable    ${prepare_data}[0]  
	#data 1st
    ${Getdata_1st}=    Set Variable    ${data}[0] 
    ${ThingIdentifier_import_1st}=    Set Variable    ${Getdata_1st['ThingIdentifier']}
    ${ThingName_import_1st}=    Set Variable    ${Getdata_1st['ThingName']}
    ${ThingSecret_import_1st}=    Set Variable    ${Getdata_1st['ThingSecret']}
    ${ConnectivityType_import_1st}=    Set Variable    ${Getdata_1st['ConnectivityType']}

	#data 2nd  
    ${Getdata_2nd}=    Set Variable    ${data}[1] 
    ${ThingIdentifier_import_2nd}=    Set Variable    ${Getdata_2nd['ThingIdentifier']}
    ${ThingName_import_2nd}=    Set Variable    ${Getdata_2nd['ThingName']}
    ${ThingSecret_import_2nd}=    Set Variable    ${Getdata_2nd['ThingSecret']}
    ${ConnectivityType_import_2nd}=    Set Variable    ${Getdata_2nd['ConnectivityType']}

	#data 3rd  
    ${Getdata_3rd}=    Set Variable    ${data}[2] 
    ${ThingIdentifier_import_3rd}=    Set Variable    ${Getdata_3rd['ThingIdentifier']}
    ${ThingName_import_3rd}=    Set Variable    ${Getdata_3rd['ThingName']}
    ${ThingSecret_import_3rd}=    Set Variable    ${Getdata_3rd['ThingSecret']}
    ${ConnectivityType_import_3rd}=    Set Variable    ${Getdata_3rd['ConnectivityType']}

	${data_import}=    Evaluate    [{ "ConnectivityType": "${ConnectivityType_import_1st}", "ThingName": "${ThingName_import_1st}", "ThingIdentifier": "${ThingIdentifier_import_1st}", "ThingSecret": "${ThingSecret_import_1st}"},{ "ConnectivityType": "${ConnectivityType_import_2nd}", "ThingName": "${ThingName_import_2nd}", "ThingIdentifier": "${ThingIdentifier_import_2nd}", "ThingSecret": "${ThingSecret_import_2nd}"},{ "ConnectivityType": "${ConnectivityType_import_3rd}", "ThingName": "${ThingName_import_3rd}", "ThingIdentifier": "${ThingIdentifier_import_3rd}", "ThingSecret": "${ThingSecret_import_3rd}"}]
    # Import Thing
	${postImportThing}=	   Import Thing    ${URL_CENTRIC}    null    ${data_import}
    Log To Console    postImportThing${postImportThing}  
	${data_response}=    Set Variable    ${postImportThing}[0]
	Log    ${data_response}  
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
	${ThingState}=    Set Variable    ${VALUE_THINGSTATE_PENDING}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

    ${random_imei_1st}=    generate random string    20    [NUMBERS]
    ${random_imei_2nd}=    generate random string    20    [NUMBERS]
    ${random_imei_3rd}=    generate random string    20    [NUMBERS]
    ${IMEI_List}=    Create List    ${random_imei_1st}    ${random_imei_2nd}    ${random_imei_3rd}
    ${IMEI_1st}=    Set Variable    ${random_imei_1st}
    ${IMEI_2nd}=    Set Variable    ${random_imei_2nd}
    ${IMEI_3rd}=    Set Variable    ${random_imei_3rd}

	#Body
	${body}=    Evaluate    [{ "ConnectivityType": "${ConnectivityType_import_1st}", "ThingName": "${ThingName_import_1st}", "ThingIdentifier": "${ThingIdentifier_import_1st}", "ThingSecret": "${ThingSecret_import_1st}", "IMEI": "${IMEI_1st}"},{ "ConnectivityType": "${ConnectivityType_import_2nd}", "ThingName": "${ThingName_import_2nd}", "ThingIdentifier": "${ThingIdentifier_import_2nd}", "ThingSecret": "${ThingSecret_import_2nd}", "IMEI": "${IMEI_2nd}"},{ "ConnectivityType": "${ConnectivityType_import_3rd}", "ThingName": "${ThingName_import_3rd}", "ThingIdentifier": "${ThingIdentifier_import_3rd}", "ThingSecret": "${ThingSecret_import_3rd}", "IMEI": "${IMEI_3rd}"}]
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_MAPPINGIMEI}    ${headers}    ${body}
	Log To Console    Response is : ${res}

	${expectResponse}=    Evaluate   [{'Status': '${VALUE_LOG_CODE_20000}','StatusDescription': '${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}'},{'Status': '${VALUE_LOG_CODE_20000}','StatusDescription': '${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}'},{'Status': '${VALUE_LOG_CODE_20000}','StatusDescription': '${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}'}]
    ${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${MAPPINGIMEI}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
    Log To Console    checkReponse is : ${checkReponse}
	
    #CheckResponse
	${length}=    Get Length    ${res}
	${index}=    Set Variable    0
	FOR    ${index}    IN RANGE    0    ${length}  
	    ${GetResponse_ConnectivityType}=    Get From Dictionary    ${res}[${index}]     ${FIELD_CONNECTIVITYTYPE}    
	    ${GetResponse_ThingName}=    Get From Dictionary    ${res}[${index}]     ${FIELD_THINGNAME}   
	    ${GetResponse_ThingIdentifier}=    Get From Dictionary    ${res}[${index}]     ${FIELD_THINGIDENTIFIER}   
	    ${GetResponse_ThingSecret}=    Get From Dictionary    ${res}[${index}]     ${FIELD_THINGSECRET}   
	    ${GetResponse_IMEI}=    Get From Dictionary    ${res}[${index}]     ${FIELD_IMEI} 
	    ${Getdata}=    Set Variable    ${data}[${index}]
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ConnectivityType}    ${Getdata['ConnectivityType']}
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingName}    ${Getdata['ThingName']}
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingIdentifier}    ${Getdata['ThingIdentifier']}
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingSecret}    ${Getdata['ThingSecret']}
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_IMEI}    ${IMEI_List}[${index}]
		${index}=    Evaluate    ${index}+1
	END

    ${pathUrl}=    Set Variable    ${URL_MAPPINGIMEI}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}${current_timestamp}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    null

	${bodyLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType_import_1st}","ThingName":"${ThingName_import_1st}","ThingIdentifier":"${ThingIdentifier_import_1st}","ThingSecret":"${ThingSecret_import_1st}","IMEI":"${IMEI_1st}"},{"ConnectivityType":"${ConnectivityType_import_2nd}","ThingName":"${ThingName_import_2nd}","ThingIdentifier":"${ThingIdentifier_import_2nd}","ThingSecret":"${ThingSecret_import_2nd}","IMEI":"${IMEI_2nd}"},{"ConnectivityType":"${ConnectivityType_import_3rd}","ThingName":"${ThingName_import_3rd}","ThingIdentifier":"${ThingIdentifier_import_3rd}","ThingSecret":"${ThingSecret_import_3rd}","IMEI":"${IMEI_3rd}"}]		
	${responseLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType_import_1st}","ThingName":"${ThingName_import_1st}","ThingIdentifier":"${ThingIdentifier_import_1st}","ThingSecret":"${ThingSecret_import_1st}","IMEI":"${IMEI_1st}","CustomDetails":null,"SupplierDetail":null,"Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}"},{"ConnectivityType":"${ConnectivityType_import_2nd}","ThingName":"${ThingName_import_2nd}","ThingIdentifier":"${ThingIdentifier_import_2nd}","ThingSecret":"${ThingSecret_import_2nd}","IMEI":"${IMEI_2nd}","CustomDetails":null,"SupplierDetail":null,"Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}"},{"ConnectivityType":"${ConnectivityType_import_3rd}","ThingName":"${ThingName_import_3rd}","ThingIdentifier":"${ThingIdentifier_import_3rd}","ThingSecret":"${ThingSecret_import_3rd}","IMEI":"${IMEI_3rd}","CustomDetails":null,"SupplierDetail":null,"Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}"}]		


	#====== Check log and Verify DB ==========
	#Check log detail and summary
	Log MappingIMEI Array    ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}    
   
    #Inquiry for verify DB   
	Connect To Mongodb    ${CONNECT_TO_MONGODB}
	${i}=    Set Variable    0
	${thingArr}=    Create List
	FOR    ${i}    IN RANGE    0    ${length}  
        ${Getdata}=    Set Variable    ${data}[${i}]
	    ${json_data}=    Set Variable    {"ThingIdentifier":"${Getdata['ThingIdentifier']}"}
        ${result_thing}=    Search All Fields    ${json_data}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
	    ${ThingId}=    Get From Dictionary    ${result_thing}    _id
	    ${ThingId_Str}=    Convert To String    ${ThingId}
        Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Things    ${ThingId_Str}    None    ${Getdata['ConnectivityType']}    ${Getdata['ThingName']}    ${Getdata['ThingIdentifier']}    ${Getdata['ThingSecret']}    ${IMEI_List}[${i}]    ${ThingState}    None    None    None    None  
		${index}=    Evaluate    ${index}+1
		Append To List    ${thingArr}    ${ThingId}
	END
    Disconnect From Mongodb	
    [Teardown]    Generic Test Case Teardown    ${MAPPINGIMEI}    ${EMPTY}    ${thingArr}


