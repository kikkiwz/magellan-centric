*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
UpdateAThing_TST_F11_0_5_002_Error_NullIMEI
    [Documentation]    Step is :    
	...    1.Create a Thing
	...    2.Update a Thing
	...    3.Delete a Thing
	#====== Start Prepare data ==========
    #Prepare data for create
    ${dataCreateAWhitelist}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1 
    ${data}=    Set Variable    ${dataCreateAWhitelist}[0] 
    Log To Console    data${data}      
    ${Getdata}=    Set Variable    ${data}[0] 
    ${ThingIdentifier_Create}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingSecret_Create}=    Set Variable    ${Getdata['ThingSecret']}
    ${IMEI_Create}=    Set Variable    ${Getdata['IMEI']}
    ${ConnectivityType_Create}=    Set Variable    ${Getdata['ConnectivityType']}
    ${ThingState_Create}=    Set Variable    ${VALUE_THINGSTATE_PENDING}

    #Create A Thing
	${postCreateAThing_1st}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType_Create}    ${ThingState_Create}    ${ThingIdentifier_Create}    ${ThingSecret_Create}    ${IMEI_Create}
    Log To Console    postCreateAThing_1st :${postCreateAThing_1st}

    #GetResponse_ThingId
	${ThingId}=    Set Variable    ${postCreateAThing_1st}[0] 
	${ThingName_Create}=    Set Variable    ${postCreateAThing_1st}[4] 
	${SupplierId_Create}=    Set Variable    ${postCreateAThing_1st}[5] 
	${SupplierName_Create}=    Set Variable    ${postCreateAThing_1st}[6]    
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_UPDATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_UPDATEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Prepare data for update
    ${random_number}=    generate random string    6    [NUMBERS]
    ${random_thingIdentifier}=    generate random string    13    [NUMBERS]
    ${random_thingSecret}=    generate random string    10    [NUMBERS]
    ${random_imei}=    generate random string    18    [NUMBERS]
	${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}    
    ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}
	${ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${random_thingIdentifier}
    ${ThingSecret}=    Set Variable    ${random_thingSecret}
    ${IMEI}=    Set Variable    ${random_imei}
	${ConnectivityType}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME_UPDATE}${random_number}
    ${CustomDetails_Key}=    Set Variable    ${VALUE_CUSTOMDETAILKEY_UPDATE}
    ${CustomDetails_Value}=    Set Variable    ${random_number}

	${ThingState}=    Set Variable    Pending
    Log To Console    WorkerName is : ${ThingName}

	#Body
    ${body}=    Evaluate    {"ThingIdentifier": "${ThingIdentifier}","ThingSecret": "${ThingSecret}"}
    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Put Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_UPDATEATHING}/${ThingId}    ${headers}    ${body}
    Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
	
    #GetResponse_Details
    ${Target}=    Set Variable    IMEI
    ${DeveloperMessage}=    Set Variable    '${Target}' must not be empty.
	${responseObjectDetail}=    Set Variable    [{'Target': '${Target}', 'DeveloperMessage': "${DeveloperMessage}"}]
    ${GetResponse_OperationStatus}=    Get From Dictionary    ${res}     ${FIELD_OPERATIONSTATUS}   
    ${GetResponse_Details}=    Get From Dictionary    ${GetResponse_OperationStatus}     ${FIELD_DETAILS}   

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Details}    ${responseObjectDetail}

    ${pathUrl}=    Set Variable    ${URL_UPDATEATHING}${ThingId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_UPDATEATHING}${current_timestamp}

	#====== Check log and Verify DB ==========
	#Check log detail and summary
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetailLog}=    Set Variable    [{"Target":"${Target}","DeveloperMessage":"${DeveloperMessage}"}]
	${bodyLog}=    Set Variable    {"ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}"}
	Log UpdateAThing Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetailLog}    ${bodyLog} 

    [Teardown]    Generic Test Case Teardown    ${CREATEATHINGNOTHAVEWORKER}    ${EMPTY}    ${ThingId}


