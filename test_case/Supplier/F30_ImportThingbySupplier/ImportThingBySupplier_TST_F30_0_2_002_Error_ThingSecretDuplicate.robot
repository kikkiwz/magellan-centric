*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
ImportThingBySupplier_TST_F30_0_2_002_Error_ThingSecretDuplicate
    [Documentation]    Step is :    
    ...   Import  Thing By Supplier
    ...   Delete a Thing

    #====== Start Prepare data ==========
    ${variable_create}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1 
    ${data}=    Set Variable    ${variable_create}[0]  
    Log To Console    data${data}      
    ${Getdata}=    Set Variable    ${data}[0] 
    ${ThingIdentifier}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingSecret}=    Set Variable    ${Getdata['ThingSecret']}
    ${IMEI}=    Set Variable    ${Getdata['IMEI']}
    ${ConnectivityType}=    Set Variable    ${Getdata['ConnectivityType']}
    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_PENDING}

    #Create A Thing
	${postCreateAThing}=    Create A Thing Not Have WorkerId  ${URL_CENTRIC}   ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postCreateAThing_1st :${postCreateAThing}

    #GetResponse_ThingId
	${ThingId}=    Set Variable    ${postCreateAThing}[0] 
	${ThingName}=    Set Variable    ${postCreateAThing}[4] 
	${SupplierId}=    Set Variable    ${postCreateAThing}[5] 
	${SupplierName}=    Set Variable    ${postCreateAThing}[6]
	
    
	#-------- Prepare data for import--------
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

	#====== End Prepare data ==========

    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
	${randomSupId}=    generate random string    24    [NUMBERS]
	${SupplierId}=    Set Variable    ${randomSupId}    
	${sup_url}=    Set Variable    ${SupplierId}/Things/Import
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_IMPORTTHINGBYSUPPLIER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_IMPORTTHINGBYSUPPLIER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret}"}]
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_IMPORTTHINGBYSUPPLIER}${sup_url}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${expectResponse}=    Evaluate    [{"Status":"${VALUE_LOG_CODE_40301}","StatusDescription":"${VALUE_DESCRIPTION_THETHINGSECRETCOULDNOTBEDUPLICATED_ERROR}"}]		

	${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${IMPORTTHINGBYSUPPLIER}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
	Log To Console    checkReponse is : ${checkReponse}

    #====== Start Prepare data : Check log ==========

    ${pathUrl}=    Set Variable    ${URL_IMPORTTHINGBYSUPPLIER}${sup_url}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_IMPORTTHINGBYSUPPLIER}${current_timestamp}

    ${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    {"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret}","IMEI":"","CustomDetails":"{}","SupplierDetail":{"SupplierId":null,"SupplierName":null}                                                          
    ${bodyLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret}"}]
    ${responseLog}=    Set Variable    [{"ConnectivityType":"${ConnectivityType1}","ThingName":"${ThingName1}","ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret},"IMEI":"","CustomDetails":"{}","SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":null},"Status":"${VALUE_LOG_CODE_40301}","StatusDescription":"${VALUE_DESCRIPTION_CHECKTHINGSECRETCOULDNOTBEDUPLICATED_ERROR}"}]		

    #====== End Prepare data : Check log and Verify DB ==========
    #Check log
    Log ImportThingBySupplierId Error    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THETHINGSECRETCOULDNOTBEDUPLICATED_ERROR}    ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog} 
	
    #Get Id For Delete
	${ThingNameArr}=    Evaluate    ["${ThingName}"]
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
	[Teardown]    Generic Test Case Teardown    ${IMPORTTHINGBYSUPPLIER}    ${EMPTY}    ${thingArr}