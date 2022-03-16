*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
PartialUpdateAThing_TST_F12_0_3_002_Error_MissingPath
    [Documentation]    Step is :    
	...    1.Update a Thing
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
		
	#Body
    ${body}=    Evaluate    [{"op": "remove"}]

    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Patch Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_PARTIALUPDATEATHING}/${ThingId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${PARTIALUPDATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_50099}    ${VALUE_DESCRIPTION_ANUNKNOWERRORHASOCCURRED_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
    [Teardown]    Generic Test Case Teardown    ${CREATEATHINGNOTHAVEWORKER}    ${EMPTY}    ${ThingId}


