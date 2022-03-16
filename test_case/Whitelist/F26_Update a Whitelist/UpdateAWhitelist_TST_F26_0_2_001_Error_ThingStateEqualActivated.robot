*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
UpdateAWhitelist_TST_F26_0_2_001_Error_ThingStateEqualActivated
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Create A Thing
	...    5.Create A Whitelist  
    ...    6.Activate Things
    ...    7.Update A Whitelist   
    ...    8.Remove A Whitelist  
	...    9.Remove Thing 
    ...    10.Remove Account
    ...    11.Remove Partner
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

    @{valArrData}=    Create List
    Append To List    ${valArrData}    ${Getdata} 

    @{valArrData2}=    Create List
    Append To List    ${valArrData2}    ${Getdata2}

	# Prepare data for Request CreateData
	#[accessToken,PartnerId,AccountId,CustomerId,AccountName,ThingIdentifierArr,OwnerType,OwnerId]
	${createResponse}=    Request CreateData for Signin Partner Account CreateAThing CreateWhitelist And Activate    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valArrData}    ${valArrData2}    ${TYPE_CUSTOMER}    ${TYPE_CUSTOMER}    ${IMEI}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI2}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}
	Log To Console    createResponse is : ${createResponse}

	${accessToken}=    Set Variable    ${createResponse}[0]
    Log To Console    AccessToken is : ${accessToken}
    ${CustomerId}=    Set Variable    ${createResponse}[2]
    Log To Console    CustomerId is : ${CustomerId}
	${AccountId}=    Set Variable    ${createResponse}[3]
    Log To Console    AccountId is : ${AccountId}
    ${OwnerId}=    Set Variable    ${createResponse}[5]
    Log To Console    OwnerId is : ${OwnerId}
    ${OwnerId2}=    Set Variable    ${createResponse}[12]
    Log To Console    OwnerId2 is : ${OwnerId2}
  

    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    # #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_UPDATEAWHITELIST_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_UPDATEAWHITELIST}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {"ThingIdentifier":["${ThingIdentifier}"]}
    Log To Console    Body is : ${body}

    #Replace Customerid in Url
    ${replace_Url_UpdateWhitelist}=    Replace String    ${URL_UPDATEAWHITELIST}    [OwnersId]    ${OwnerId2}
    Log To Console    TESTURL : :${replace_Url_UpdateWhitelist}

    # #Response
    ${res}=    Run keyword And Continue On Failure    Put Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${replace_Url_UpdateWhitelist}    ${headers}    ${body}
	Log To Console    Response is : ${res}


    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error  ${res}    ${UPDATEAWHITELIST}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_RESULTCODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}     
    Log To Console    checkReponse is : ${checkReponse}


    ${pathUrl}=    Set Variable    ${replace_Url_UpdateWhitelist}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_UPDATEAWHITELIST_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null    	 
    ${responseObjectDetail}=    Set Variable    [{"Target":"ThingIdentifier","DeveloperMessage":"The ThingIdentifier '${ThingIdentifier}' could not be found."}]
    
    ${bodyChecklog}=    Set Variable    {"ThingIdentifier":["${ThingIdentifier}"]} 
    


	#====== End Prepare data ==========	

	#Check log detail and summary
    Log UpdateAWhitelist Error    ${VALUE_RESULTCODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${VALUE_RESULTCODE_40400}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${AccountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${bodyChecklog}

   
    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNTATHINGARRAY}    ${createResponse}    null