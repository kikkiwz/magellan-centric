*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
DeleteAWhitelist_TST_F29_0_3_000_Error_MissingOwnerId
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Create A Thing
	...    7.Create A Whitelist  
    ...    8.Delete A Whitelist    
	...    9.Remove Thing 
    ...    10.Remove Account
    ...    11.Remove Partner
    #====== Start Prepare data ==========


	# Prepare data for create thing
	${valArrDataWhitelist}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1
	Log To Console    valArrDataWhitelist is : ${valArrDataWhitelist}

    ${valArrData}=    Set Variable    ${valArrDataWhitelist[0]}
    Log To Console    valArrData is : ${valArrDataWhitelist[0]}
    ${valArrDataThingIdentifier}=    Set Variable    ${valArrDataWhitelist[1]}
    Log To Console    valArrDataThingIdentifier is : ${valArrDataThingIdentifier}
    
    ${ThingName}=    Set Variable    ${valArrData[0]['ThingName']}
    ${IMEI}=    Set Variable    ${valArrData[0]['IMEI']}
    ${ThingSecret}=    Set Variable    ${valArrData[0]['ThingSecret']}
    ${ThingIdentifier}=    Set Variable    ${valArrData[0]['ThingIdentifier']}
    ${ConnectivityType}=    Set Variable    ${valArrData[0]['ConnectivityType']}
    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_PENDING}

	# Prepare data for Request CreateData
	# [accessToken,PartnerId,AccountId,CustomerId,AccountName,ThingIdentifierArr,OwnerType,OwnerId]
	${createResponse}=    Request CreateData for Signin Partner Account AThing And CreateWhitelist    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valArrData}    ${TYPE_CUSTOMER}    ${TYPE_CUSTOMER}    ${valArrDataThingIdentifier}    ${IMEI}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}
	Log To Console    createResponse is : ${createResponse}

	${accessToken}=    Set Variable    ${createResponse}[0]
    # Log To Console    AccessToken is : ${accessToken}
    ${CustomerId}=    Set Variable    ${createResponse}[2]
    Log To Console    CustomerId is : ${CustomerId}
	${AccountId}=    Set Variable    ${createResponse}[3]
    Log To Console    AccountId is : ${AccountId}
    ${ThingId}=    Set Variable    ${createResponse}[5]
    Log To Console    ThingId is : ${ThingId}



    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    # #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAWHITELIST_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAWHITELIST}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {"ThingIdentifier":["${ThingIdentifier}"]}
    Log To Console    Body is : ${body}


    # #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_DELETEAWHITELIST_MISSINGOWNERID}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error  ${res}    ${DELETEAWHITELIST}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_RESULTCODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}     
    Log To Console    checkReponse is : ${checkReponse}



    ${pathUrl}=    Set Variable    ${URL_DELETEAWHITELIST_MISSINGOWNERID}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETEAWHITELIST_FAIL}${current_timestamp}


    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null    	 
    ${responseObjectDetail}=    Set Variable    null
    ${bodyChecklog}=    Set Variable    {"ThingIdentifier":["${ThingIdentifier}"]} 
    


	#====== End Prepare data ==========	

	#Check log detail and summary
    Log DeleteAWhitelist RouteNotFound Error    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${AccountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyChecklog}

    #Inquiry for verify DB   
    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNTATHING}    ${createResponse}    null