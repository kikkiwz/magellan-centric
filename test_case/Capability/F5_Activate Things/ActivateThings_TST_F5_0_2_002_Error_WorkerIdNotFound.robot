*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
ActivateThings_TST_F5_0_2_002_Error_WorkerIdNotFound
    [Documentation]    Step is :    
    ...   Create a Worker
    ...   Create a Thing No Have Worker
    ...   Activate Things
    ...   Delete a Thing
    ...   Delete Worker
    #====== Start Prepare data ==========


    #-------- Prepare data 1 --------
	#ThingName1
    ${random_number1}=    generate random string    6    [NUMBERS]
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
	${randomIMEI1}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMEI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMEI3}=    Evaluate    random.randint(100000, 999999)    random
	${IMEI1}=    Set Variable    ${randomIMEI1}${randomIMEI2}${randomIMEI3}
	Log To Console    IMEI1 is : ${IMEI1}

	#set ThingSecret1 (20 digit)
	${randomIMSI1}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI3}=    Evaluate    random.randint(10000, 99999)    random
	${ThingSecret1}=    Set Variable    ${randomIMSI1}${randomIMSI2}${randomIMSI3}
	Log To Console    ThingSecret1 is : ${ThingSecret1}

	#set ThingIdentifier1 (896603 + 13 digit)
	${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier1}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
	Log To Console    ThingIdentifier1 is : ${ThingIdentifier1}	

    #-------- Prepare data 2 --------
    #ThingName2
    ${random_number2}=    generate random string    6    [NUMBERS]
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

	#set ThingSecret2 (3 digit)
	${randomIMSI4}=    generate random string    3    [NUMBERS]
	# ${randomIMSI4}=    Evaluate    random.randint(1000, 999)    random
	${ThingSecret2}=    Set Variable    ${randomIMSI4}
	Log To Console    ThingSecret2 is : ${ThingSecret2}

	#set ThingIdentifier2 (13 digit)
	${randomICCID3}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID4}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier2}=    Set Variable    ${randomICCID3}${randomICCID4}
	Log To Console    ThingIdentifier2 is : ${ThingIdentifier2}	


    ${ThingState1}=    Set Variable    ${VALUE_THINGSTATE_PENDING}
    ${ThingState2}=    Set Variable    ${VALUE_THINGSTATE_PENDING}



	#Prepare data for Request CreateData
	${createResponse}=    Request CreateData for CreateAWorker And CreateAThing No Have WorkerId    ${ConnectivityType1}    ${ThingState1}    ${ThingIdentifier1}    ${ThingSecret1}    ${IMEI1}              
	Log To Console    createResponse is : ${createResponse}
	${WorkerId}=    Set Variable    ${createResponse}[0]
    Log To Console    WorkerId is : ${WorkerId}
    ${ThingId}=    Set Variable    ${createResponse}[1]
    Log To Console    ThingId is : ${ThingId}
    ${ThingName}=    Set Variable    ${createResponse}[2]
    Log To Console    ThingName is : ${ThingName}
    ${SupplierId}=    Set Variable    ${createResponse}[3]
    Log To Console    SupplierId is : ${SupplierId}
    ${SupplierName}=    Set Variable    ${createResponse}[4]
    Log To Console    SupplierName is : ${SupplierName}


    ${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${WorkerId}
 

    #====== End Prepare data ==========
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_ACTIVATETHINGS}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}","IMEI":"${IMEI1}"}]
    Log To Console    Body is : ${body}

    #Replace Workerid in Url
    ${replaceUrl}=    Replace String    ${URL_ACTIVATETHINGS}    [WorkerID]    ${WorkerId}
    Log To Console    TESTURL : :${replaceUrl}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${replaceUrl}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${VERIFIESTHINGS}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}
    Log To Console    checkReponse is : ${checkReponse}


    ${pathUrl}=    Set Variable    ${replaceUrl}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

    # ${endPointName}=    Set Variable    ["db.WorkersCollection"]
	# ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}
    ${responseObjectDetail}=    Set Variable    [{"Target":"WorkerId","DeveloperMessage":"The WorkerId '${WorkerId}' could not be found."}]

	${bodyLog}=    Set Variable    [{"ThingIdentifier":"${ThingIdentifier1}","ThingSecret":"${ThingSecret1}","IMEI":"${IMEI1}"}]


    #====== Check log and Verify DB ==========	
    Log ActivateThings Error     ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}         

   
    [Teardown]    Generic Test Case Teardown    ${ACTIVATETHINGSNOTDELETEWORKER}    ${createResponse}    null