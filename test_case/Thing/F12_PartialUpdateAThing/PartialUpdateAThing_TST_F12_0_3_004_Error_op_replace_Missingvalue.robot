*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
PartialUpdateAThing_TST_F12_0_3_004_Error_op_replace_Missingvalue
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Thing
	...    3.Update a Thing
	...    4.Delete a Worker
	...    5.Delete a Thing
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
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_PARTIALUPDATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Prepare data for update
    ${random_number}=    generate random string    6    [NUMBERS]
    ${SupplierId_Update}=    Set Variable    ${random_number}

	#Body
    ${body}=    Evaluate    [{"op": "replace","path": "/SupplierDetail/SupplierId"},{"op": "add","path": "/SupplierDetail/SupplierName"}]

    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Patch Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_PARTIALUPDATEATHING}/${ThingId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${PARTIALUPDATEATHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    #GetResponse_ThingId
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
	${ThingId}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGID}    
	Log To Console    ThingId is : ${ThingId}

	${GetResponse_ConnectivityType}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CONNECTIVITYTYPE}    
	${GetResponse_ThingName}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGNAME}   
	${GetResponse_ThingIdentifier}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGIDENTIFIER}   
	${GetResponse_ThingSecret}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSECRET}   
	${GetResponse_IMEI}=    Get From Dictionary    ${ThingInfo}     ${FIELD_IMEI} 
	${GetResponse_ThingState}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSTATE}  
	${GetResponse_CustomDetails}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CUSTOMDETAILS} 
	${GetResponse_SupplierDetail}=    Get From Dictionary    ${ThingInfo}     ${FIELD_SUPPLIERDETAILS}  	
	${GetResponse_SupplierDetail_CreatedDatetime}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CREATEDATETIME} 
	${GetResponse_SupplierDetail_LastUpdatedTimestamp}=    Get From Dictionary    ${ThingInfo}     ${FIELD_LASTUPDATETINESTAMP}

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ConnectivityType}    ${ConnectivityType_Create}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingName}    ${ThingName_Create}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingIdentifier}    ${ThingIdentifier_Create}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingSecret}    ${ThingSecret_Create}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_IMEI}    ${IMEI_Create}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingState}    ${ThingState_Create}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_CustomDetails}    {}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierDetail}    {}
	Should Not Be Empty    ${GetResponse_SupplierDetail_CreatedDatetime}
	Should Not Be Empty    ${GetResponse_SupplierDetail_LastUpdatedTimestamp}

    ${pathUrl}=    Set Variable    ${URL_PARTIALUPDATEATHING}${ThingId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_PARTIALUPDATEATHING}${current_timestamp}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	${bodyLog}=    Set Variable    [{"op":"replace","path":"/SupplierDetail/SupplierId"},{"op":"add","path":"/SupplierDetail/SupplierName"}]
	Log PartailUpdateAThing Success    ${res}    ${pathUrl}    ${dataSearch}    ${bodyLog}

    #Inquiry for verify DB   
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Things    ${ThingId}    None    ${ConnectivityType_Create}    ${ThingName_Create}    ${ThingIdentifier_Create}    ${ThingSecret_Create}    ${IMEI_Create}    ${ThingState_Create}    None    None    None    None    
    [Teardown]    Generic Test Case Teardown    ${PARTIALUPDATEATHING}    ${EMPTY}    ${ThingId}



