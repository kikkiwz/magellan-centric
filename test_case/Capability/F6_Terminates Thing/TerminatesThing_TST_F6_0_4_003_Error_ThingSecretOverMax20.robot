*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
TerminatesThing_TST_F6_0_4_003_Error_ThingSecretOverMax20
    [Documentation]    Step is :    
    ...   Create a Worker
    ...   Create a Thing No Have Worker
    ...   Activate Things
    ...   Delete a Thing
    ...   Delete Worker
    #====== Start Prepare data ==========


    #-------- Prepare data 1 --------
	${ConnectivityType}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
	Log To Console    ConnectivityType is : ${ConnectivityType}

	#set IMEI1 (20 digit)
	${randomIMEI1}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMEI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMEI3}=    Evaluate    random.randint(100000, 999999)    random
	${IMEI}=    Set Variable    ${randomIMEI1}${randomIMEI2}${randomIMEI3}
	Log To Console    IMEI is : ${IMEI}

	#set ThingSecret1 (20 digit)
	${randomIMSI1}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI3}=    Evaluate    random.randint(10000, 99999)    random
	${ThingSecret}=    Set Variable    ${randomIMSI1}${randomIMSI2}${randomIMSI3}
	Log To Console    ThingSecret is : ${ThingSecret}

	#set ThingIdentifier1 (896603 + 13 digit)
	${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
	Log To Console    ThingIdentifier is : ${ThingIdentifier}	

    #-------- Prepare data 2 --------
	${ConnectivityType2}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_WIFI}
	Log To Console    ConnectivityType2 is : ${ConnectivityType2}

	
	#set IMEI2 (15 digit)
	${randomIMEI4}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMEI5}=    Evaluate    random.randint(1000000, 9999999)    random
	${IMEI2}=    Set Variable    ${randomIMEI4}
	Log To Console    IMEI2 is : ${IMEI2}

    #set ThingSecret2 (20 digit)
	${randomIMSI1}=    Evaluate    random.randint(10000000, 99999999)    random
	${randomIMSI2}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomIMSI3}=    Evaluate    random.randint(100000, 999999)    random
	${ThingSecret2}=    Set Variable    ${randomIMSI1}${randomIMSI2}${randomIMSI3}
	Log To Console    ThingSecret2 is : ${ThingSecret2}

	#set ThingIdentifier1 (896603 + 13 digit)
	${randomICCID3}=    Evaluate    random.randint(1000000, 9999999)    random
	${randomICCID4}=    Evaluate    random.randint(100000, 999999)    random
	${ThingIdentifier2}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID3}${randomICCID4}
	Log To Console    ThingIdentifier2 is : ${ThingIdentifier2}
    #for sesponse ThingIdentifier2 (896603 + 13 digit)
	${ThingIdentifier2Response}=    Set Variable    ${FIELD_ICCIDPRE}${ThingIdentifier2}


    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_PENDING}
    ${ThingState2}=    Set Variable    ${VALUE_THINGSTATE_PENDING}


	#Prepare data for Request CreateData
	${createResponse}=    Request CreateData for CreateAWorker And CreateAThing No Have WorkerId And ActivateThings    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}              
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



    # ====== End Prepare data ==========
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_TERMINATESTHINGS_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_TERMINATESTHINGS}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret2}","IMEI":"${IMEI}"}]
    Log To Console    Body is : ${body}

    #Replace Workerid in Url
    ${replaceUrl}=    Replace String    ${URL_TERMINATESTHINGS}    [WorkerID]    ${WorkerId}
    Log To Console    TESTURL : :${replaceUrl}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${replaceUrl}    ${headers}    ${body}
	Log To Console    Response is : ${res}


    ${expectResponse}=    Evaluate    [{"Status":"${VALUE_LOG_CODE_40000}","StatusDescription":"${VALUE_DESCRIPTION_THINGSECRETOVERMAX20_ERROR}"}]		

	${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${TERMINATESTHINGS}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
	Log To Console    checkReponse is : ${checkReponse}

    #====== Start Prepare data : Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${replaceUrl}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_TERMINATESTHINGS_FAIL}${current_timestamp}

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.ThingsCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"200:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"200:InquiryThing was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"200:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"200:InquiryThing was Success", "processTime":null }]}
    # ${responseObjectDetail}=    Set Variable    null

    ${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    null
                                               
    ${bodyLog}=    Set Variable    [{"ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret2}","IMEI":"${IMEI}"}]		
    ${responseLog}=    Set Variable    [{"ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret2}","IMEI":"${IMEI}","Status":"${VALUE_LOG_CODE_40000}","StatusDescription":"${VALUE_DESCRIPTION_THINGSECRETOVERMAX20_ERROR}"}]		

    #====== End Prepare data : Check log and Verify DB ==========
    #====== Check log and Verify DB ==========	
    Log TerminatesThings Array    ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}          

   
    [Teardown]    Generic Test Case Teardown    ${TERMINATESTHINGS}    ${createResponse}    null
