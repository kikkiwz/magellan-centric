*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
TerminatesThing_TST_F6_0_2_000_Error_ThingStateIdle
    [Documentation]    Step is :    
    ...   Create a Worker
    ...   Create a Thing No Have Worker
    ...   Activate Things
    ...   Delete a Thing
    ...   Delete Worker
    #====== Start Prepare data ==========


    ${Preparedata}=    Prepare data for create    2
    Log To Console    Preparedata: ${Preparedata}    
    ${data}=    Set Variable    ${Preparedata}    
    Log To Console    data: ${data} 
    ${Getdata}=    Set Variable    ${data}[0] 
    Log To Console    Getdata: ${Getdata} 
    ${Getdata2}=    Set Variable    ${data}[1] 
    Log To Console    Getdata2: ${Getdata2} 


    ${ThingIdentifier}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingSecret}=    Set Variable    ${Getdata['ThingSecret']}
    ${IMEI}=    Set Variable    ${Getdata['IMEI']}
    ${ConnectivityType}=    Set Variable    ${Getdata['ConnectivityType']}
    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_IDLE}

    ${ThingIdentifier2}=    Set Variable    ${Getdata2['ThingIdentifier']}
    ${ThingSecret2}=    Set Variable    ${Getdata2['ThingSecret']}
    ${IMEI2}=    Set Variable    ${Getdata2['IMEI']}
    ${ConnectivityType2}=    Set Variable    ${Getdata2['ConnectivityType']}
    ${ThingState2}=    Set Variable    ${VALUE_THINGSTATE_IDLE}


	#Prepare data for Request CreateData
	${createResponse}=    Request CreateData for CreateAWorker And CreateAThing    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}              
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
    ${body}=    Evaluate    [{"ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}"}]
    Log To Console    Body is : ${body}

    #Replace Workerid in Url
    ${replaceUrl}=    Replace String    ${URL_TERMINATESTHINGS}    [WorkerID]    ${WorkerId}
    Log To Console    TESTURL : :${replaceUrl}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${replaceUrl}    ${headers}    ${body}
	Log To Console    Response is : ${res}


    ${expectResponse}=    Evaluate    [{"Status":"${VALUE_LOG_CODE_40301}","StatusDescription":"${VALUE_DESCRIPTION_THECLIENTREQUESTEDALREADYEXISTS_ERROR}"}]		

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
                                               
    ${bodyLog}=    Set Variable    [{"ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}"}]		
    ${responseLog}=    Set Variable    [{"ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","Status":"${VALUE_LOG_CODE_40301}","StatusDescription":"${VALUE_DESCRIPTION_THECLIENTREQUESTEDALREADYEXISTS_ERROR}"}]		

    #====== End Prepare data : Check log and Verify DB ==========
    #====== Check log and Verify DB ==========	
    Log TerminatesThings Array    ${responseLog}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyLog}          

    [Teardown]    Generic Test Case Teardown    ${TERMINATESTHINGS}    ${createResponse}    null
