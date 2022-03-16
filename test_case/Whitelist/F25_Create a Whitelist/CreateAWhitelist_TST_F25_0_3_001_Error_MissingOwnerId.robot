*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
CreateAWhitelist_TST_F25_0_3_001_Error_MissingOwnerId
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Create A Thing
	...    7.Create A Whitelist     
    ...    8.Remove A Whitelist  
	...    9.Remove Thing 
    ...    10.Remove Account
    ...    11.Remove Partner
    #====== Start Prepare data ==========


    ${dataCreateAWhitelist}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1
    ${data}=    Set Variable    ${dataCreateAWhitelist}[0]    
    ${Getdata}=    Set Variable    ${data}[0] 
    ${ThingIdentifier}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingSecret}=    Set Variable    ${Getdata['ThingSecret']}
    ${IMEI}=    Set Variable    ${Getdata['IMEI']}
    ${ConnectivityType}=    Set Variable    ${Getdata['ConnectivityType']}
    ${IMEI}=    Set Variable    ${Getdata['IMEI']}
    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_PENDING}
    ${OwnerType_Account}=    Set Variable    ${OWNERTYPE_ACCOUNT}
    # Log To Console    datadata:${data}
    # Log To Console    ThingIdentifier:${ThingIdentifier}
    # Log To Console    ThingSecret:${ThingSecret}
    # Log To Console    IMEI:${IMEI}
    # Log To Console    ConnectivityType:${ConnectivityType}
    # Log To Console    IMEI:${IMEI}
    # Log To Console    ThingState:${ThingState}


    


	# Prepare data for Request CreateData
	${createResponse}=    Request CreateData for Signin Partner Account and CreateAThing    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ConnectivityType}    ${ThingState}       
	Log To Console    createResponse is : ${createResponse}
	${accessToken}=    Set Variable    ${createResponse}[0]
    Log To Console    AccessToken is : ${accessToken}
    ${CustomerId}=    Set Variable    ${createResponse}[2]
    Log To Console    CustomerId is : ${CustomerId}
	${AccountId}=    Set Variable    ${createResponse}[3]
    Log To Console    AccountId is : ${AccountId}
    ${ThingId}=    Set Variable    ${createResponse}[5]
    Log To Console    ThingId is : ${ThingId}



    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    # #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAWHITELIST_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAWHITELIST}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    [{"OwnerType":"${OwnerType_Tenant}","ThingIdentifier":["${ThingIdentifier}"]}]
    Log To Console    Body is : ${body}

    # #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_CREATEAWHITELIST}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response Status And StatusDespcription Should Have Error    ${res}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${URL_CREATEAWHITELIST}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEAWHITELIST_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null    	 
    ${responseObjectDetail}=    Set Variable    null
    ${bodyChecklog}=    Set Variable    [{"OwnerType":"${OwnerType_Tenant}","ThingIdentifier":["${ThingIdentifier}"]}] 


	#====== End Prepare data ==========	

	# # #Check log detail and summary
    Log CreateAWhitelist Error    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_CREATEAWHITELIST_SUCCESS1}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${AccountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyChecklog}

    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNTATHING}    ${createResponse}    null