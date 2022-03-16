*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAThing_TST_F8_0_2_000_Error_WorkerIdNotFound
    [Documentation]    Step is :    
	...    1.Create a Thing
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#WorkerName
    ${random_number}=    generate random string    6    [NUMBERS]
    ${random_thingIdentifier}=    generate random string    13    [NUMBERS]
    ${random_thingSecret}=    generate random string    20    [NUMBERS]
    ${random_imei}=    generate random string    20    [NUMBERS]
	${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}    
    ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
	${ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${random_thingIdentifier}
    ${ThingSecret}=    Set Variable    ${random_thingSecret}
    ${IMEI}=    Set Variable    ${random_imei}
	${ConnectivityType}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
    ${WorkerId}=    Set Variable    60dc33dbae0e300001e8b777
	${ThingState}=    Set Variable    Pending
    Log To Console    WorkerName is : ${ThingName}

	#Body
    ${body}=    Evaluate    {"WorkerId": "${WorkerId}","ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier": "${ThingIdentifier}","ThingSecret": "${ThingSecret}","IMEI": "${IMEI}","CustomDetails":{},"SupplierDetail": {"SupplierId": "${SupplierId}","SupplierName": "${SupplierName}"}}
    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_CREATEATHING}    ${headers}    ${body}
	Log To Console    Response is : ${res}
    Log    ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
	
    #GetResponse_Details
    ${Target}=    Set Variable    WorkerId
    ${DeveloperMessage}=    Set Variable    The WorkerId '${WorkerId}' could not be found.
	${responseObjectDetail}=    Set Variable    [{'Target': '${Target}', 'DeveloperMessage': "${DeveloperMessage}"}]
    ${GetResponse_OperationStatus}=    Get From Dictionary    ${res}     ${FIELD_OPERATIONSTATUS}   
    ${GetResponse_Details}=    Get From Dictionary    ${GetResponse_OperationStatus}     ${FIELD_DETAILS}   

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Details}    ${responseObjectDetail}

    ${pathUrl}=    Set Variable    ${URL_CREATEATHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEATHING}${current_timestamp}

	#====== Check log and Verify DB ==========
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetailLog}=    Set Variable    [{"Target":"${Target}","DeveloperMessage":"${DeveloperMessage}"}]
	${bodyLog}=    Set Variable    {"WorkerId":"${WorkerId}","ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","CustomDetails":{},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}
	Log CreateAThing Error    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetailLog}    ${bodyLog} 


