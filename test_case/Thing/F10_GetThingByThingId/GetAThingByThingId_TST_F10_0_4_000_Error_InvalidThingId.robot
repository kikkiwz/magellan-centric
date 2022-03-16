*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
GetAThingByThingId_TST_F10_0_4_000_Error_InvalidThingId  
     [Documentation]    Step is :    
	...    1.GetAThingByThingId
	#====== Start Prepare data ==========
	${ThingId}=    Set Variable    111111  
	#====== End Prepare data ==========
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_GETTHINGBYTHINGID}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_GETTHINGBYTHINGID}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_GETTHINGBYTHINGID}/${ThingId}   ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    #GetResponse_Details
	${responseObjectDetail}=    Set Variable    [{'Target': 'ThingId', 'DeveloperMessage': "'ThingId' is not Object Id."}]
    ${GetResponse_OperationStatus}=    Get From Dictionary    ${res}     ${FIELD_OPERATIONSTATUS}   
    ${GetResponse_Details}=    Get From Dictionary    ${GetResponse_OperationStatus}     ${FIELD_DETAILS}   

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Details}    ${responseObjectDetail}
	#====== Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${URL_GETTHINGBYTHINGID}/${ThingId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_GETTHINGBYTHINGID}${current_timestamp}
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetailLog}=    Set Variable    [{"Target":"ThingId","DeveloperMessage":"'ThingId' is not Object Id."}]
	${bodyLog}=    Set Variable    null
	Log GetAThingByThingId Error       ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetailLog}    ${bodyLog} 

