*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
PartialUpdateAThing_TST_F12_0_3_000_Error_MissingThingId
    [Documentation]    Step is :    
	...    1.Update a Thing

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_PARTIALUPDATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#Body
    ${body}=    Evaluate    [{"op": "remove","path": "/SupplierDetail/SupplierId"},{"op": "remove","path": "/SupplierDetail/SupplierName"}]

    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Patch Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_PARTIALUPDATEATHING}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${PARTIALUPDATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40500}    ${VALUE_DESCRIPTION_METHODNOTALLOWED_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
	
    ${pathUrl}=    Set Variable    ${URL_PARTIALUPDATEATHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_PARTIALUPDATEATHING}${current_timestamp}
	#====== Check log and Verify DB ==========
	#Check log detail and summary
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetailLog}=    Set Variable    null
	${bodyLog}=    Set Variable    [{"op":"remove","path":"/SupplierDetail/SupplierId"},{"op":"remove","path":"/SupplierDetail/SupplierName"}]
	Log PartailUpdateAThing Error    ${VALUE_LOG_CODE_40500}    ${VALUE_DESCRIPTION_METHODNOTALLOWED_ERROR}    ${VALUE_LOG_CODE_40500}    ${VALUE_DESCRIPTION_METHODNOTALLOWED_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetailLog}    ${bodyLog} 


