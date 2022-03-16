*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
ReturnsAListOfThings_TST_F9_1_1_001_Success_FilterThingName
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
    ${fillter}=    Set Variable    ?%24Filter=ThingName%20eq%20'${ThingName}'
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


	${GetResponse_ThingId}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_THINGID}  
	${GetResponse_ConnectivityType}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_CONNECTIVITYTYPE}    
	${GetResponse_ThingName}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_THINGNAME}   
	${GetResponse_ThingIdentifier}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_THINGIDENTIFIER}   
	${GetResponse_ThingSecret}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_THINGSECRET}   
	${GetResponse_IMEI}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_IMEI} 
	${GetResponse_ThingState}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_THINGSTATE}  
	${GetResponse_CustomDetails}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]    ${FIELD_CUSTOMDETAILS}
	${GetResponse_SupplierDetail}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]    ${FIELD_SUPPLIERDETAILS}
	${GetResponse_SupplierDetail_SupplierId}=    Get From Dictionary    ${GetResponse_SupplierDetail}     ${FIELD_SUPPLIERID} 
	${GetResponse_SupplierDetail_SupplierName}=    Get From Dictionary    ${GetResponse_SupplierDetail}     ${FIELD_SUPPLIERNAME} 
	${GetResponse_SupplierDetail_CreatedDatetime}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_CREATEDATETIME} 
	${GetResponse_SupplierDetail_LastUpdatedTimestamp}=    Get From Dictionary    ${GetResponse_ThingInfo}[0]     ${FIELD_LASTUPDATETINESTAMP}
	${Metadata}=    Set Variable    {'CurrentPage': 1, 'TotalPages': 1, 'Top': 10, 'TotalCount': 1, 'HasPrevious': False, 'HasNext': False}

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingId}    ${ThingId}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ConnectivityType}    ${VALUE_CONNECTIVITYTYPE_NBIOT}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingName}    ${ThingName}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingIdentifier}    ${ThingIdentifier}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingSecret}    ${ThingSecret}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_IMEI}    ${IMEI}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingState}    ${ThingState}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_CustomDetails}    {}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierDetail_SupplierId}    ${SupplierId}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierDetail_SupplierName}    ${SupplierName}
	Should Not Be Empty    ${GetResponse_SupplierDetail_CreatedDatetime}
	Should Not Be Empty    ${GetResponse_SupplierDetail_LastUpdatedTimestamp}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Metadata}    ${Metadata}

    ${pathUrl}=    Set Variable    ${URL_THINGRETURNSALISTOFTHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_THINGRETURNSALISTOFTHING}${current_timestamp}
	${bodyLog}=    Set Variable    {"$Filter":"ThingName eq '${ThingName}'"}

	#====== Check log and Verify DB ==========
	#Check log detail and summary
	Log ReturnsAListOfThing Success   ${res}    ${pathUrl}    ${dataSearch}    ${bodyLog}
    [Teardown]    Generic Test Case Teardown    ${THINGRETURNSALISTOFTHING}    ${EMPTY}    ${ThingId}
