*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
ReturnsAListOfThings_TST_F9_1_1_003_Success_Page2
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
    ${fillter}=    Set Variable    ?%24Top=1&%24Page=1&%24Select=${FIELD_THINGSECRET}&%24Filter=${FIELD_THINGSECRET}%20eq%20'${ThingSecret}'
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_THINGRETURNSALISTOFTHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_THINGRETURNSALISTOFTHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_THINGRETURNSALISTOFTHING}${fillter}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${THINGRETURNSALISTOFTHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}


    #GetResponse_ThingInfo
    ${GetResponse_ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO} 
	${GetResponse_Metadata}=    Get From Dictionary    ${res}     @Metadata
	${GetResponse_Metadata_Top}=    Get From Dictionary    ${GetResponse_Metadata}     Top
	${GetResponse_Metadata_Page}=    Get From Dictionary    ${GetResponse_Metadata}     CurrentPage
    ${GetResponse_ThingInfo_Length}=    Get Length    ${GetResponse_ThingInfo}

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingInfo_Length}    1
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Metadata_Top}    1
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Metadata_Page}    1

    ${pathUrl}=    Set Variable    ${URL_THINGRETURNSALISTOFTHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_THINGRETURNSALISTOFTHING}${current_timestamp}
	${bodyLog}=    Set Variable    {"$Top":"1","$Page":"1","$Select":"ThingSecret","$Filter":"ThingSecret eq '${ThingSecret}'"}

	#====== Check log and Verify DB ==========
	#Check log detail and summary
	Log ReturnsAListOfThing Success   ${res}    ${pathUrl}    ${dataSearch}    ${bodyLog}
    [Teardown]    Generic Test Case Teardown    ${THINGRETURNSALISTOFTHING}    ${EMPTY}    ${ThingId}
