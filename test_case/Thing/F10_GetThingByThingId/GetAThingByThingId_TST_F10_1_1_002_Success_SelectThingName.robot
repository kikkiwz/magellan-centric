*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
GetAThingByThingId_TST_F10_1_1_002_Success_SelectThingName
     [Documentation]    Step is :    
	...    1.Create a Thing
	...    2.GetAThingByThingId
	...    3.Delete a Thing
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
	#====== End Prepare data ==========
    ${fillter}=    Set Variable    ?%24Select=${FIELD_THINGNAME}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_GETTHINGBYTHINGID}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_GETTHINGBYTHINGID}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_GETTHINGBYTHINGID}/${ThingId}${fillter}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${GETTHINGBYTHINGID}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    #GetResponse_ThingInfo
    ${GetResponse_ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO} 
	${GetResponse_ThingName}=    Get From Dictionary    ${GetResponse_ThingInfo}     ${FIELD_THINGNAME}   
	
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingName}    ${ThingName}

    ${pathUrl}=    Set Variable    ${URL_GETTHINGBYTHINGID}/${ThingId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_GETTHINGBYTHINGID}${current_timestamp}
	${bodyLog}=    Set Variable    {"$Select":"ThingName"}
    ${resLog}=    Evaluate    {'ThingInfo': {'ThingId':'null','WorkerId':'null','ConnectivityType':'null','${FIELD_THINGNAME}':'${ThingName}','ThingIdentifier':'null','ThingSecret':'null','IMEI':'null','ThingState':'null','CustomDetails':'null','SupplierDetail':'null','CreatedDatetime':'null','LastUpdatedTimestamp':'null'}, 'OperationStatus': {'Code': '20000', 'DeveloperMessage': 'The requested operation was successfully.'}}
	#====== Check log and Verify DB ==========
	#Check log detail and summary
	Log GetAThingByThingId Success    ${resLog}    ${pathUrl}    ${dataSearch}    ${bodyLog}
    [Teardown]    Generic Test Case Teardown    ${GETTHINGBYTHINGIDNOTHAVEWORKER}    ${EMPTY}    ${ThingId}

