*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
ImportThing_TST_F1_1_1_002_Error_ThingIdentifierDuplicate
    [Documentation]    Step is :    
    ...   Import  Thing
    ...   Delete a Thing

    #====== Start Prepare data ==========


    #-------- Prepare data 1 --------
	#ThingName1
    ${random_number1}=    generate random string    8    [NUMBERS]
    ${ThingName1}=    Set Variable    ${VALUE_ATHINGNAME}${random_number1}
    Log To Console    ThingName1 is : ${ThingName1}

	${ConnectivityType1}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
	Log To Console    ConnectivityType1 is : ${ConnectivityType1}
	${CustomDetails1}=    Set Variable    {}
	Log To Console    CustomDetails1 is : ${CustomDetails1}
	${SupplierId1}=    Set Variable    ${VALUE_SUPPLIERID}${random_number1}
	Log To Console    SupplierId1 is : ${SupplierId1}
	${SupplierName1}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number1}
	Log To Console    SupplierName1 is : ${SupplierName1}

	#set IMEI1 (20 digit)
	${randomIMEI1}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMEI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMEI3}=    Evaluate    random.randint(10000, 99999)    random
	${IMEI1}=    Set Variable    ${randomIMEI1}${randomIMEI2}${randomIMEI3}
	Log To Console    IMEI1 is : ${IMEI1}

	#set ThingSecret1 (20 digit)
	${randomIMSI1}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI3}=    Evaluate    random.randint(10000, 99999)    random
	${ThingSecret1}=    Set Variable    ${randomIMSI1}${randomIMSI2}${randomIMSI3}
	Log To Console    ThingSecret1 is : ${ThingSecret1}

	#set ThingIdentifier1 (19 digit : 896603 + 13 digit)
	${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier1}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
	Log To Console    ThingIdentifier1 is : ${ThingIdentifier1}	

    #-------- Prepare data 2 --------
    #ThingName2
    ${random_number2}=    generate random string    8    [NUMBERS]
    ${ThingName2}=    Set Variable    ${VALUE_ATHINGNAME}${random_number2}
    Log To Console    ThingName2 is : ${ThingName2}

	${ConnectivityType2}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_WIFI}
	Log To Console    ConnectivityType2 is : ${ConnectivityType2}
	${CustomDetails2}=    Set Variable    {}
	Log To Console    CustomDetails2 is : ${CustomDetails2}
	${SupplierId2}=    Set Variable    ${VALUE_SUPPLIERID}${random_number1}
	Log To Console    SupplierId2 is : ${SupplierId2}
	${SupplierName2}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number1}
	Log To Console    SupplierName2 is : ${SupplierName2}
	${ThingState2}=    Set Variable    ${VALUE_THINGSTATE_IDLE}
	Log To Console    ThingState2 is : ${ThingState2}
	
	#set IMEI2 (15 digit)
	${randomIMEI4}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMEI5}=    Evaluate    random.randint(1000000, 9999999)    random
	${IMEI2}=    Set Variable    ${randomIMEI4}${randomIMEI5}
	Log To Console    IMEI2 is : ${IMEI2}

	#set ThingSecret2 
	${randomIMSI4}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI5}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI6}=    Evaluate    random.randint(10000, 99999)    random
	${ThingSecret2}=    Set Variable    ${randomIMSI4}${randomIMSI5}
	Log To Console    ThingSecret2 is : ${ThingSecret2}

	#set ThingIdentifier2 (13 digit)
	${randomICCID3}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID4}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier2}=    Set Variable    ${randomICCID3}${randomICCID4}
	Log To Console    ThingIdentifier2 is : ${ThingIdentifier2}	
	#for sesponse ThingIdentifier2 (19 digit : 896603 + 13 digit)
	${ThingIdentifier2Response}=    Set Variable    ${FIELD_ICCIDPRE}${ThingIdentifier2}



    # ====== End Prepare data ==========
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_IMPORTTHING_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_IMPORTTHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"ConnectivityType":"${ConnectivityType1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}"}]
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_IMPORTTHING}    ${headers}    ${body}
	Log To Console    Response is : ${res}


    ${expectResponse}=    Evaluate    [{"Status":"${VALUE_LOG_CODE_40000}","StatusDescription":"${VALUE_DESCRIPTION_THINGNAMEISREQUIRED_ERROR}"}]		

	${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${IMPORTTHING}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
	Log To Console    checkReponse is : ${checkReponse}

    # #====== Start Prepare data : Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${URL_IMPORTTHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_IMPORTTHING_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    null
                                               
    ${bodyLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}"}]		
    ${responseLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType1}","ThingName":null,"ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}","IMEI":"","CustomDetails":"{}","SupplierDetail":{"SupplierId":null,"SupplierName":null},"Status":"${VALUE_LOG_CODE_40000}","StatusDescription":"${VALUE_DESCRIPTION_THINGNAMEISREQUIRED_ERROR}"}]		

    #====== End Prepare data : Check log and Verify DB ==========
    #====== Check log and Verify DB ==========	
    Log ImportThing Array    ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}          

    
