*** Settings ***
Resource    ../../../variables/Variables.robot
Resource    ../../../keyword/Keyword.robot
#Suite Setup      Open Directory

*** Test Cases ***
################### Post ###################
DeleteAWhitelist_TST_F29_1_1_000_Success_NotSendThingIdentifier
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


	#Prepare data for create thing
	${valArrDataWhitelist}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1
    ${valArrData}=    Set Variable    ${valArrDataWhitelist[0]}
    ${valArrDataThingIdentifier}=    Set Variable    ${valArrDataWhitelist[1]}
    ${ThingName}=    Set Variable    ${valArrData[0]['ThingName']}
    ${IMEI}=    Set Variable    ${valArrData[0]['IMEI']}
    ${ThingSecret}=    Set Variable    ${valArrData[0]['ThingSecret']}
    ${ThingIdentifier}=    Set Variable    ${valArrData[0]['ThingIdentifier']}
    ${ConnectivityType}=    Set Variable    ${valArrData[0]['ConnectivityType']}
    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_PENDING}

	#Prepare data for Request CreateData
	${createResponse}=    Request CreateData for Signin Partner Account AThing And CreateWhitelist    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valArrData}    ${TYPE_CUSTOMER}    ${TYPE_CUSTOMER}    ${valArrDataThingIdentifier}    ${IMEI}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}
	Log To Console    createResponse is : ${createResponse}
	${accessToken}=    Set Variable    ${createResponse}[0]
    ${CustomerId}=    Set Variable    ${createResponse}[2]
	${AccountId}=    Set Variable    ${createResponse}[3]
    ${ThingId}=    Set Variable    ${createResponse}[5]
    ${OwnerId}=    Set Variable    ${createResponse}[11]    
    

    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAWHITELIST}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAWHITELIST}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {}
    Log To Console    Body is : ${body}

    #Replace Ownerid in Url
    ${replace_Url_DeleteWhitelist}=    Replace String    ${URL_DELETEAWHITELIST}    [OwnerId]    ${OwnerId}
 
    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${replace_Url_DeleteWhitelist}    ${headers}    ${body}
	Log To Console    Response is : ${res}


    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${DELETEAWHITELIST}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}


    ${pathUrl}=    Set Variable    ${replace_Url_DeleteWhitelist}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETEAWHITELIST}${current_timestamp}
    ${bodyCheckLog}=    Set Variable    {}    

	#====== End Prepare data ==========	
	#Check log detail and summary
    Log DeleteAWhitelist Success NotSendThingidentifier    ${res}    ${pathUrl}    ${dataSearch}    ${AccountId}    ${ThingIdentifier}    ${BodyCheckLog}         

    #Inquiry for verify DB   
	Connect To Mongodb    ${CONNECT_TO_MONGODB}
	${json_data}=    Set Variable    {"ThingIdentifier":"${ThingIdentifier}"}
    ${result_thing}=    Search All Fields    ${json_data}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_WHITELISTDEVICE}
    ${MarkStatusTrue}=    Set Variable    ${result_thing['RemoveStatus']}     
    Disconnect From Mongodb	
    #Check Search Not Found 
	Run keyword And Continue On Failure    Should Be Equal As Strings    True    ${MarkStatusTrue}     
   
    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNTATHING}    ${createResponse}    null
