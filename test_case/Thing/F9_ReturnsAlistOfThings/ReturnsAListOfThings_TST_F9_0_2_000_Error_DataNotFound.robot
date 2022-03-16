*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
ReturnsAListOfThings_TST_F9_0_2_000_Error_DataNotFound
     [Documentation]    Step is :    
	...    1.Create a Thing
	...    2.ReturnsAListOfThings
	...    3.Delete a Thing
	#====== Start Prepare data ==========
    ${dataCreateAWhitelist}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1 
    ${data}=    Set Variable    ${dataCreateAWhitelist}[0]  
    Log To Console    data${data}      
    ${Getdata}=    Set Variable    ${data}[0] 
    ${ThingIdentifier}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingSecret}=    Set Variable    ${Getdata['ThingSecret']}
    ${IMEI}=    Set Variable    ${Getdata['IMEI']}
    ${ConnectivityType}=    Set Variable    ${Getdata['ConnectivityType']}
    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_PENDING}

    #Create A Thing
	${postCreateAThing_1st}=    Create A Thing Not Have WorkerId   ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postCreateAThing_1st :${postCreateAThing_1st}

    #GetResponse_ThingId
	${ThingId}=    Set Variable    ${postCreateAThing_1st}[0] 
	${ThingName}=    Set Variable    ${postCreateAThing_1st}[4] 
	${SupplierId}=    Set Variable    ${postCreateAThing_1st}[5] 
	${SupplierName}=    Set Variable    ${postCreateAThing_1st}[6] 
 
	#====== End Prepare data ==========
    ${fillter}=    Set Variable    ?%24Filter=${FIELD_THINGID}%20eq%20'60bdb6f05889a40001399cc1'
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_THINGRETURNSALISTOFTHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_THINGRETURNSALISTOFTHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_THINGRETURNSALISTOFTHING}${fillter}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${THINGRETURNSALISTOFTHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    #GetResponse_ThingInfo
	${GetResponse_Metadata}=    Get From Dictionary    ${res}     @Metadata
	${Metadata}=    Set Variable    {'CurrentPage': 1, 'TotalPages': 0, 'Top': 10, 'TotalCount': 0, 'HasPrevious': False, 'HasNext': False}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Metadata}    ${Metadata}	
	#====== Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${URL_THINGRETURNSALISTOFTHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_THINGRETURNSALISTOFTHING}${current_timestamp}
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetailLog}=    Set Variable    {"ThingInfo":null,"@Metadata":${Metadata},"OperationStatus":{"Code":"${VALUE_LOG_CODE_40400}","DeveloperMessage":"${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}"}}
	${bodyLog}=    Set Variable    {"$Filter":"ThingId eq '60bdb6f05889a40001399cc1'"}
	Log ReturnsAListOfThing Error       ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetailLog}    ${bodyLog} 

    [Teardown]    Generic Test Case Teardown    ${THINGRETURNSALISTOFTHING}    ${EMPTY}    ${ThingId}

