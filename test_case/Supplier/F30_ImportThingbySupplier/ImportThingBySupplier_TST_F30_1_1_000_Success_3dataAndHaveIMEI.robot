*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
ImportThingBySupplier_TST_F30_1_1_000_Success_3dataAndHaveIMEI
    [Documentation]    Step is :    
    ...   Import  Thing By Supplier
    ...   Delete a Thing

    #====== Start Prepare data ==========

    #-------- Prepare data 1 --------
    ${random_number1}=    generate random string    8    [NUMBERS]
    ${ThingName1}=    Set Variable    ${VALUE_ATHINGNAME}${random_number1}
	${ConnectivityType1}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
	${CustomDetails1}=    Set Variable    {}
	${SupplierId1}=    Set Variable    ${VALUE_SUPPLIERID}${random_number1}
	${SupplierName1}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number1}

	#set IMEI1 (20 digit)
	${randomIMEI1}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMEI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMEI3}=    Evaluate    random.randint(10000, 99999)    random
	${IMEI1}=    Set Variable    ${randomIMEI1}${randomIMEI2}${randomIMEI3}

	#set ThingSecret1 (20 digit)
	${randomIMSI1}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI3}=    Evaluate    random.randint(10000, 99999)    random
	${ThingSecret1}=    Set Variable    ${randomIMSI1}${randomIMSI2}${randomIMSI3}

	#set ThingIdentifier1 (19 digit : 896603 + 13 digit)
	${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier1}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}

    #-------- Prepare data 2 --------
    ${random_number2}=    generate random string    8    [NUMBERS]
    ${ThingName2}=    Set Variable    ${VALUE_ATHINGNAME}${random_number2}
	${ConnectivityType2}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_WIFI}
	${CustomDetails2}=    Set Variable    {}
	${SupplierId2}=    Set Variable    ${VALUE_SUPPLIERID}${random_number2}
	${SupplierName2}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number2}
	${ThingState2}=    Set Variable    ${VALUE_THINGSTATE_IDLE}
	
	#set IMEI2 (15 digit)
	${randomIMEI4}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMEI5}=    Evaluate    random.randint(1000000, 9999999)    random
	${IMEI2}=    Set Variable    ${randomIMEI4}${randomIMEI5}

	#set ThingSecret2 
	${randomIMSI4}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI5}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI6}=    Evaluate    random.randint(10000, 99999)    random
	${ThingSecret2}=    Set Variable    ${randomIMSI4}${randomIMSI5}${randomIMSI6}

	#set ThingIdentifier2 (19 digit)
	${randomICCID3}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID4}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier2}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID3}${randomICCID4}
	#for sesponse ThingIdentifier2 (19 digit : 896603 + 13 digit)
	${ThingIdentifier2Response}=    Set Variable    ${FIELD_ICCIDPRE}${ThingIdentifier2}

    #-------- Prepare data 3 --------
    #ThingName3
    ${random_number3}=    generate random string    8    [NUMBERS]
    ${ThingName3}=    Set Variable    ${VALUE_ATHINGNAME}${random_number3}

	${ConnectivityType3}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_CELLULAR}
	${CustomDetails3}=    Set Variable    {}
	${SupplierId3}=    Set Variable    ${VALUE_SUPPLIERID}${random_number3}
	${SupplierName3}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number3}
	${ThingState3}=    Set Variable    ${VALUE_THINGSTATE_IDLE}

	#set IMEI2 (15 digit)
	${randomIMEI6}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMEI7}=    Evaluate    random.randint(1000000, 9999999)    random
	${IMEI3}=    Set Variable    ${randomIMEI6}${randomIMEI7}

	#set ThingSecret3 
	${randomIMSI7}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI8}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI9}=    Evaluate    random.randint(10000, 99999)    random
	${ThingSecret3}=    Set Variable    ${randomIMSI7}${randomIMSI8}${randomIMSI9}

	#set ThingIdentifier3 (19 digit)
	${randomICCID5}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID6}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier3}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID5}${randomICCID6}
	Log To Console    ThingIdentifier2 is : ${ThingIdentifier3}	
	#for sesponse ThingIdentifier2 (19 digit : 896603 + 13 digit)
	${ThingIdentifier3Response}=    Set Variable    ${FIELD_ICCIDPRE}${ThingIdentifier3}
    #====== End Prepare data ==========

    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
	${randomSupId}=    generate random string    24    [NUMBERS]
	${SupplierId}=    Set Variable    ${randomSupId}    
	${sup_url}=    Set Variable    ${SupplierId}/Things/Import
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_IMPORTTHINGBYSUPPLIER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_IMPORTTHINGBYSUPPLIER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}","IMEI":"${IMEI1}"},{"ConnectivityType":"${ConnectivityType2}","ThingName":"${ThingName2}","ThingIdentifier":"${ThingIdentifier2}","ThingSecret":"${ThingSecret2}","IMEI":"${IMEI2}"},{"ConnectivityType":"${ConnectivityType3}","ThingName":"${ThingName3}","ThingIdentifier":"${ThingIdentifier3}","ThingSecret":"${ThingSecret3}","IMEI":"${IMEI3}"}]
    Log To Console    Body is : ${body}

    #Response
	Log To Console    url : ${URL_IMPORTTHINGBYSUPPLIER}${sup_url}
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_IMPORTTHINGBYSUPPLIER}${sup_url}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    #Check Status and StatusDescription
    ${expectResponse}=    Evaluate    [{"Status":"${VALUE_LOG_CODE_20100}","StatusDescription":"${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}"},{"Status":"${VALUE_LOG_CODE_20100}","StatusDescription":"${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}"},{"Status":"${VALUE_LOG_CODE_20100}","StatusDescription":"${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}"}]		
	${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${IMPORTTHINGBYSUPPLIER}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
	Log To Console    checkReponse is : ${checkReponse}

    #Check Body Response  
	${length}=    Get Length    ${res}
	${i}=    Set Variable    0
	FOR    ${i}    IN RANGE    ${length}
        ${GetResponse_ConnectivityType}=    Get From Dictionary    ${res}[${i}]     ${FIELD_CONNECTIVITYTYPE} 
		${GetResponse_ThingName}=    Get From Dictionary    ${res}[${i}]     ${FIELD_THINGNAME}  
	    ${GetResponse_ThingIdentifier}=    Get From Dictionary    ${res}[${i}]     ${FIELD_THINGIDENTIFIER}  
	    ${GetResponse_ThingSecret}=    Get From Dictionary    ${res}[${i}]     ${FIELD_THINGSECRET}   
	    ${GetResponse_IMEI}=    Get From Dictionary    ${res}[${i}]     ${FIELD_IMEI}
	    ${GetResponse_CustomDetails}=    Get From Dictionary    ${res}[${i}]     ${FIELD_CUSTOMDETAILS}
		${GetResponse_SupplierDetail}=    Get From Dictionary    ${res}[${i}]     ${FIELD_SUPPLIERDETAILS}
	    ${GetResponse_SupplierDetail_SupplierId}=    Get From Dictionary    ${GetResponse_SupplierDetail}     ${FIELD_SUPPLIERID} 
        ${j}=    Evaluate    ${i}+1
	    Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ConnectivityType}    ${ConnectivityType${j}}
	    Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingName}    ${ThingName${j}}
	    Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingIdentifier}    ${ThingIdentifier${j}}
	    Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingSecret}    ${ThingSecret${j}}
	    Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_IMEI}    ${IMEI${j}}
	    Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_CustomDetails}    {}
	    Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierDetail_SupplierId}    ${SupplierId}
    END 
    #====== Start Prepare data : Check log and Verify DB ==========
    ${pathUrl}=    Set Variable    ${URL_IMPORTTHINGBYSUPPLIER}${sup_url}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_IMPORTTHINGBYSUPPLIER}${current_timestamp}

    ${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    null
                                               
    ${bodyLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}","IMEI":"${IMEI1}"},{"ConnectivityType":"${ConnectivityType2}","ThingName":"${ThingName2}","ThingIdentifier":"${ThingIdentifier2}","ThingSecret":"${ThingSecret2}","IMEI":"${IMEI2}"},{"ConnectivityType":"${ConnectivityType3}","ThingName":"${ThingName3}","ThingIdentifier":"${ThingIdentifier3}","ThingSecret":"${ThingSecret3}","IMEI":"${IMEI3}"}]		
    ${responseLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}","IMEI":"${IMEI1}","CustomDetails":"{}","SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":null},"Status":"20100","StatusDescription":"The requested operation was successfully."},{"ConnectivityType":"${ConnectivityType2}","ThingName":"${ThingName2}","ThingIdentifier":"${ThingIdentifier2}","ThingSecret":"${ThingSecret2}","IMEI":"${IMEI2}","CustomDetails":"{}","SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":null},"Status":"20100","StatusDescription":"The requested operation was successfully."},{"ConnectivityType":"${ConnectivityType3}","ThingName":"${ThingName3}","ThingIdentifier":"${ThingIdentifier3}","ThingSecret":"${ThingSecret3}","IMEI":"${IMEI3}","CustomDetails":"{}","SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":null},"Status":"20100","StatusDescription":"The requested operation was successfully."}]
	${bodyDB}=    Evaluate    [{"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}","IMEI":"${IMEI1}","CustomDetails":"{}","SupplierDetail":{"SupplierId":"${SupplierId}"},"Status":"20100","StatusDescription":"The requested operation was successfully."},{"ConnectivityType":"${ConnectivityType2}","ThingName":"${ThingName2}","ThingIdentifier":"${ThingIdentifier2}","ThingSecret":"${ThingSecret2}","IMEI":"${IMEI2}","CustomDetails":"{}","SupplierDetail":{"SupplierId":"${SupplierId}"},"Status":"20100","StatusDescription":"The requested operation was successfully."},{"ConnectivityType":"${ConnectivityType3}","ThingName":"${ThingName3}","ThingIdentifier":"${ThingIdentifier3}","ThingSecret":"${ThingSecret3}","IMEI":"${IMEI3}","CustomDetails":"{}","SupplierDetail":{"SupplierId":"${SupplierId}"},"Status":"20100","StatusDescription":"The requested operation was successfully."}]		
    #====== End Prepare data : Check log and Verify DB ==========

    #Check log
    Log ImportThingBySupplierId Array   ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}          

    #Inquiry for verify DB   
	${count}=    Get Length    ${bodyDB}
	FOR    ${i}    IN RANGE    ${count}
        Request Verify DB Check Data ImportThingBySupplier    ${bodyDB}[${i}]    ${ThingName${i+1}}    ${i+1}
    END 

	#Get Id For Delete
	${ThingNameArr}=    Evaluate    ["${ThingName1}","${ThingName2}","${ThingName3}"]
	${NameCount}=    Get Length    ${ThingNameArr} 
	${thingArr}=    Create List
	FOR    ${i}    IN RANGE    ${NameCount}      
	    Connect To Mongodb    ${CONNECT_TO_MONGODB}
	    ${json_data}=    Set Variable    {"ThingName":"${ThingNameArr}[${i}]"}
        ${result_thing}=    Search All Fields    ${json_data}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
	    ${ThingId}=    Get From Dictionary    ${result_thing}    _id
	    ${ThingId_Str}=    Convert To String    ${ThingId}
	    Append To List    ${thingArr}    ${ThingId_Str}	
        Disconnect From Mongodb	
	    Log To Console    thingArr${thingArr}
	END
	[Teardown]    Generic Test Case Teardown    ${IMPORTTHING}    ${EMPTY}    ${thingArr}
