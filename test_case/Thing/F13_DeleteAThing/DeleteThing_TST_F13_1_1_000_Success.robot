*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
DeleteThing_TST_F13_1_1_000_Success
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
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request Not Data    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_REMOVEATHING}${ThingId}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEATHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}


    ${pathUrl}=    Set Variable    ${URL_REMOVEATHING}${ThingId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_REMOVEATHING}${current_timestamp}
	${bodyLog}=    Set Variable    null

	#====== Check log and Verify DB ==========
	#Check log detail and summary
	Log DeleteaThing Success    ${res}    ${pathUrl}    ${dataSearch}    ${bodyLog}
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data DeleteThing Success Check Nofound    ${ThingId}    None    ${ConnectivityType_Create}    ${ThingName_Create}    ${ThingIdentifier_Create}    ${ThingSecret_Create}    ${IMEI_Create}    ${ThingState_Create}    ${SupplierId_Create}    ${SupplierName_Create}



