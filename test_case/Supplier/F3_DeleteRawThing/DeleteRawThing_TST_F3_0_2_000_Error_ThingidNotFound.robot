*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
DeleteRawThing_TST_F3_0_2_000_Error_ThingidNotFound
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Thing
	...    3.Update a Thing
	...    4.Delete a Worker
	...    5.Delete a Thing
	#====== Start Prepare data ==========
	${ThingId}=    Set Variable    61372a777c3a5200016fc8ca
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}

    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETERAWTHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETERAWTHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request Not Data    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_REMOVEATHING}${ThingId}/Raw    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${REMOVEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
	
    #GetResponse_Details
	${responseObjectDetail}=    Set Variable    [{'Target': 'ThingId', 'DeveloperMessage': "The ThingId '${ThingId}' could not be found."}]
    ${GetResponse_OperationStatus}=    Get From Dictionary    ${res}     ${FIELD_OPERATIONSTATUS}   
    ${GetResponse_Details}=    Get From Dictionary    ${GetResponse_OperationStatus}     ${FIELD_DETAILS}   

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Details}    ${responseObjectDetail}

    ${pathUrl}=    Set Variable    ${URL_REMOVEATHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETERAWTHING}${current_timestamp}
	${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    [{"Target":"ThingId","DeveloperMessage":"The ThingId '${ThingId}' could not be found."}]
	#====== Check log and Verify DB ==========

	#Check log detail and summary
    Log DeleteRawThing Error    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
   



  



