*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
ReturnsAListOfThings_TST_F7_1_1_000_Success_GetAll
    [Documentation]    Step is :    
    ...   Create a Worker
    ...   Create a Thing
    ...   Create a Thing
    ...   Returns a list of Things
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


    # Log To Console    ThingIdentifier:${ThingIdentifier}
    # Log To Console    ThingSecret:${ThingSecret}
    # Log To Console    IMEI:${IMEI}
    # Log To Console    ConnectivityType:${ConnectivityType}
    # Log To Console    ThingState:${ThingState}

    # Log To Console    ThingIdentifier2:${ThingIdentifier2}
    # Log To Console    ThingSecret2:${ThingSecret2}
    # Log To Console    IMEI2:${IMEI2}
    # Log To Console    ConnectivityType2:${ConnectivityType2}
    # Log To Console    ThingState2:${ThingState2}



	#Prepare data for Request CreateData
	${createResponse}=    Request CreateData for CreateAWorker And CreateAThing2    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}              
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
    ${ThingId2}=    Set Variable    ${createResponse}[5]
    Log To Console    ThingId2 is : ${ThingId2}
    ${ThingName2}=    Set Variable    ${createResponse}[6]
    Log To Console    ThingName2 is : ${ThingName2}
    ${SupplierId2}=    Set Variable    ${createResponse}[7]
    Log To Console    SupplierId2 is : ${SupplierId2}
    ${SupplierName2}=    Set Variable    ${createResponse}[8]
    Log To Console    SupplierName2 is : ${SupplierName2}
 

    # ====== End Prepare data ==========
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_RETURNSALISTOFTHINGS}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFTHINGS}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {}
    Log To Console    Body is : ${body}

    #Replace Workerid in Url
    ${replaceUrl}=    Replace String    ${URL_RETURNSALISTOFTHINGS}    [WorkerID]    ${WorkerId}
    Log To Console    TESTURL : :${replaceUrl}

    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${replace_Url}    ${headers}    
	Log To Console    Response is : ${res}

    ${OperationStatus}=    Set Variable    ${res['OperationStatus']}    
    Log To Console    OperationStatus is : ${OperationStatus}
    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${RETURNSALISTOFWHITELIST}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    #====== Start Prepare data : Check log and Verify DB ==========

    ${pathUrl}=    Set Variable    ${replaceUrl}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_RETURNSALISTOFTHINGS}${current_timestamp}

    ${bodyLog}=    Set Variable    null

	#Check log detail and summary
    Log ReturnsAListofThings Success    ${res}    ${pathUrl}    ${dataSearch}    ${bodyLog} 
    
