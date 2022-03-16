*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAThing_TST_F8_0_2_002_Error_ThingSecretDuplicate
    [Documentation]    Step is :    
	...    1.Create a Thing
	...    2.Create a Thing
	...    3.Delete a Thing
	#====== Start Prepare data ==========
    ${random_number_1st}=    generate random string    6    [NUMBERS]
    ${random_thingIdentifier_1st}=    generate random string    13    [NUMBERS]
    ${random_thingSecret_1st}=    generate random string    20    [NUMBERS]
    ${random_imei_1st}=    generate random string    20    [NUMBERS]
	${ConnectivityType_1st}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
	${ThingState_1st}=    Set Variable    Pending
	${ThingIdentifier_1st}=    Set Variable    ${FIELD_ICCIDPRE}${random_thingIdentifier_1st}
    ${ThingSecret_1st}=    Set Variable    ${random_thingSecret_1st}
    ${IMEI_1st}=    Set Variable    ${random_imei_1st}

    #Create A Thing
	${postCreateAThing_1st}=    Create A Thing Not Have WorkerId   ${URL_CENTRIC}    ${ConnectivityType_1st}    ${ThingSecret_1st}    ${ThingIdentifier_1st}    ${ThingSecret_1st}    ${IMEI_1st}
    Log To Console    postCreateAThing_1st :${postCreateAThing_1st}

    #GetResponse_ThingId
	${ThingId_1st}=    Set Variable    ${postCreateAThing_1st}[0]  
	Log To Console    ThingId is : ${ThingId_1st}
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEATHING}_1${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    ${random_number_2nd}=    generate random string    7    [NUMBERS]
    ${random_thingIdentifier_2nd}=    generate random string    13    [NUMBERS]
    ${random_thingSecret_2nd}=    generate random string    20    [NUMBERS]
    ${random_imei_2nd}=    generate random string    20    [NUMBERS]
	${ConnectivityType_2nd}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
	${ThingIdentifier_2nd}=    Set Variable    ${FIELD_ICCIDPRE}${random_thingIdentifier_2nd}
    ${ThingSecret_2nd}=    Set Variable    ${random_thingSecret_2nd}
    ${IMEI_2nd}=    Set Variable    ${random_imei_2nd}
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number_2nd}
	${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number_2nd}    
    ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number_2nd}

	#Body
    ${body}=    Evaluate    {"ConnectivityType": "${ConnectivityType_2nd}","ThingName" : "${ThingName}","ThingIdentifier": "${ThingIdentifier_2nd}","ThingSecret": "${ThingSecret_1st}","IMEI": "${IMEI_2nd}","CustomDetails":{},"SupplierDetail": {"SupplierId": "${SupplierId}","SupplierName": "${SupplierName}"}}
    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_CREATEATHING}    ${headers}    ${body}
	Log To Console    Response is : ${res}
    Log    ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
	
    #GetResponse_Details
    ${Target}=    Set Variable    ThingSecret
    ${DeveloperMessage}=    Set Variable    The ${Target} could not be duplicated.
	${responseObjectDetail}=    Set Variable    [{'Target': '${Target}', 'DeveloperMessage': '${DeveloperMessage}'}]
    ${GetResponse_OperationStatus}=    Get From Dictionary    ${res}     ${FIELD_OPERATIONSTATUS}   
    ${GetResponse_Details}=    Get From Dictionary    ${GetResponse_OperationStatus}     ${FIELD_DETAILS}   

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Details}    ${responseObjectDetail}

    ${pathUrl}=    Set Variable    ${URL_CREATEATHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEATHING}_1${current_timestamp}

	#====== Check log and Verify DB ==========
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetailLog}=    Set Variable    [{"Target":"${Target}","DeveloperMessage":"${DeveloperMessage}"}]
	${bodyLog}=    Set Variable    {"ConnectivityType":"${ConnectivityType_2nd}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier_2nd}","ThingSecret":"${ThingSecret_1st}","IMEI":"${IMEI_2nd}","CustomDetails":{},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}
	Log CreateAThing Error    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetailLog}    ${bodyLog} 
    [Teardown]    Generic Test Case Teardown    ${CREATEATHINGNOTHAVEWORKER}    ${EMPTY}    ${ThingId_1st}




