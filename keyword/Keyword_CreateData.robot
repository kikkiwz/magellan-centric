*** Keywords ***
Signin
    [Arguments]    ${url}    ${username}    ${password}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_SIGNIN}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_SIGNIN}    Accept=${HEADER_ACCEPT}  
    ${data}=    Evaluate    {"username": "${username}","password": "${password}"}   
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_SIGNIN}    ${headers}    ${data}
	#Log To Console    Response Signin : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${SINGNIN}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	#accessToken
	${accessToken}=    Get From Dictionary    ${res}     ${FIELD_ACCESSTOKEN}
	#Log To Console    ${accessToken}
	[return]    ${accessToken}

#=====================================================================================================================================================#

Create Partner
    [Arguments]    ${url}    ${accessToken}
    #Generate Random number
    ${random_number}=    generate random string    6    [NUMBERS]
	#PartnerName
	${PartnerName}=    Set Variable    ${VALUE_PARTNERNAME}${random_number}
	#MerchantContact
	${MerchantContact}=    Set Variable    ${VALUE_MERCHANTCONTACT}
	#CPID
	${CPID}=    Set Variable    ${VALUE_CPID}
	
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEPARTNER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEPARTNER}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerName": "${PartnerName}","PartnerType": ["Supplier","Customer"],"PartnerDetail": {"MerchantContact": "${MerchantContact}","CPID": "${CPID}"},"Property": {"RouteEngine": "false"}}   
    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATEPARTNER}    ${headers}    ${data}
    Log To Console    Response Create Partner : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEPARTNER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_PartnerId
    ${PartnerInfo}=    Get From Dictionary    ${res}     ${FIELD_PARTNERINFO}   
    # Log To Console    ${PartnerInfo}	
	${GetResponse_PartnerId}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_PARTNERID}    
	# Log To Console    ${GetResponse_PartnerId}	
	${GetResponse_CustomerId}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_CUSTOMERID}
    ${PartnerType}=    Set Variable     ${PartnerInfo['PartnerType']}
	${setPartnerTypeArr}=    Set Variable    '${PartnerType}[0]', '${PartnerType}[1]' 
    ${Property}=    Set Variable     ${PartnerInfo['Property']}
	${RouteEngine}=    Set Variable    ${Property['RouteEngine']}
    #AccountName
    ${AccountName}=    Set Variable    ${VALUE_ACCOUNTNAME}${random_number}
    #Log To Console    ${AccountName}
    #ConfigGroupName
    #Log To Console    ${ConfigGroupName}
    [Return]    ${GetResponse_PartnerId}    ${AccountName}    ${PartnerName}    ${GetResponse_CustomerId}    ${setPartnerTypeArr}    ${RouteEngine}    ${MerchantContact}    ${CPID}   


#=====================================================================================================================================================#

Create Account
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}    ${AccountName}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}
    #Log To Console    ${headers}
    ${randomSensorApp}=    Evaluate    random.randint(100, 999)    random
    ${data}=    Evaluate    {"PartnerID": "${PartnerId}","AccountName": "${AccountName}${randomSensorApp}"}

    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATEACCOUNT}    ${headers}    ${data}
	Log To Console    Response Create Account : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEACCOUNT}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_AccountName
    ${PartnerInfo}=    Get From Dictionary    ${res}     ${FIELD_PARTNERINFO}   
    #Log To Console    ${PartnerInfo}	
	${AccountInfo}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_ACCOUNTINFO}  
	#Log To Console    ${AccountInfo}	
	${GetResponse_AccountName}=    Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTNAME}    
	#Log To Console    ${GetResponse_AccountName}
	#GetResponse_AccountId
	${GetResponse_AccountId}=        Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTID}    
    #Log To Console    ${GetResponse_AccountId} 
	
	[return]    ${GetResponse_AccountId}     ${GetResponse_AccountName}    

#=====================================================================================================================================================#

Create A Worker
    [Arguments]    ${url}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    
    
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAWORKER}
	#Log To Console    ${headers}
	
	#ThingName
    ${random_number}=    generate random string    8    [NUMBERS]
    ${WorkerName}=    Set Variable    ${VALUE_WORKNAME}${random_number}
    #Log To Console    ${ThingName}
    ${data}=    Evaluate    { "WorkerName": "${WorkerName}", "ServerProperties": { "ServerIP": "${ServerIP}", "ServerPort": "${ServerPort}", "ServerDomain": "${ServerDomain}" }, "WorkerState": "${WorkerState}" }
    # Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_CREATEAWORKER}    ${headers}    ${data}
	#Log To Console    Response Create A Worker : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEAWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	
	#GetResponse_ThingID
    ${WorkersInfo}=    Get From Dictionary    ${res}     ${FIELD_WORKERSINFO}   
    #Log To Console    ${WorkersInfo}	
	${GetResponse_WorkerID}=    Get From Dictionary    ${WorkersInfo}     ${FIELD_WORKERID}    
	#Log To Console    ${GetResponse_WorkerID}
	
	[return]    ${GetResponse_WorkerID}    ${WorkerName}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}


#=====================================================================================================================================================#
Create A Thing Not Have WorkerId
    [Arguments]    ${url}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${imei}    


	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary     Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEATHING}    Accept=${HEADER_ACCEPT}
	Log To Console    ${headers}
		

    #ThingName
    ${random_number}=    generate random string    8    [NUMBERS]
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
    #Log To Console    ${ThingName}
    #SupplierId
    ${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}
    #SupplierName
    ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}


    ${data}=    Evaluate    { "ConnectivityType": "${ConnectivityType}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${imei}", "ThingState": "${ThingState}", "CustomDetails": { }, "SupplierDetail": { "SupplierId": "${SupplierId}", "SupplierName": "${SupplierName}" } }
    Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_CREATEATHING}    ${headers}    ${data}
	Log To Console    Response Create A Thing Not Have WorkerId : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEATHINGNOTHAVEWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	
	#GetResponse_ThingID
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
    Log To Console    ${ThingInfo}	
	${GetResponse_ThingID}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGID}    
	Log To Console    ${GetResponse_ThingID}
	${GetResponse_IMEI}=    Get From Dictionary    ${ThingInfo}     ${FIELD_IMEI}    
	${GetResponse_ThingIdentifier}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGIDENTIFIER}  
	${GetResponse_ThingSecret}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSECRET}  
    ${GetResponse_ThingName}=    Set Variable    ${ThingInfo['ThingName']} 
    ${SupplierDetail}=    Set Variable    ${ThingInfo['SupplierDetail']}    
    ${SupplierId}=    Set Variable    ${SupplierDetail['SupplierId']}
    ${SupplierName}=    Set Variable    ${SupplierDetail['SupplierName']}
	
	[return]    ${GetResponse_ThingID}    ${GetResponse_IMEI}    ${GetResponse_ThingIdentifier}    ${GetResponse_ThingSecret}    ${GetResponse_ThingName}    ${SupplierId}    ${SupplierName}   
    


#=====================================================================================================================================================#
Create A Thing Have WorkerId
    [Arguments]    ${url}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${imei}    ${WorkerId}    


	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary     Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEATHING}    Accept=${HEADER_ACCEPT}
	Log To Console    ${headers}
		
    #ThingName
    ${random_number}=    generate random string    8    [NUMBERS]
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
    #Log To Console    ${ThingName}
    #SupplierId
    ${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}
    #SupplierName
    ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}


    ${data}=    Evaluate    { "WorkerId": "${WorkerId}", "ConnectivityType": "${ConnectivityType}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${imei}", "ThingState": "${ThingState}", "CustomDetails": { }, "SupplierDetail": { "SupplierId": "${SupplierId}", "SupplierName": "${SupplierName}" } }
    Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_CREATEATHING}    ${headers}    ${data}
	Log To Console    Create A Thing Have WorkerId ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEATHINGHAVEWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	
	#GetResponse_ThingID
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
    Log To Console    ${ThingInfo}	
	${GetResponse_ThingID}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGID}    
	Log To Console    ${GetResponse_ThingID}
	${GetResponse_IMEI}=    Get From Dictionary    ${ThingInfo}     ${FIELD_IMEI}    
	${GetResponse_ThingIdentifier}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGIDENTIFIER}  
	${GetResponse_ThingSecret}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSECRET}  
    ${GetResponse_ThingName}=    Set Variable    ${ThingInfo['ThingName']} 
    ${SupplierDetail}=    Set Variable    ${ThingInfo['SupplierDetail']}    
    ${SupplierId}=    Set Variable    ${SupplierDetail['SupplierId']}
    ${SupplierName}=    Set Variable    ${SupplierDetail['SupplierName']}    
 
	
	[return]    ${GetResponse_ThingID}    ${GetResponse_IMEI}    ${GetResponse_ThingIdentifier}    ${GetResponse_ThingSecret}    ${GetResponse_ThingName}    ${SupplierId}    ${SupplierName}        

#=====================================================================================================================================================#
Import Thing
    [Arguments]    ${url}    ${accessToken}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_SIM3G}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}

    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_IMPORTTHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_IMPORTTHING}  
        #Log To Console    ${headers}

        ${body}=    Evaluate    { "ConnectivityType": "${data[${i}]['ConnectivityType']}", "ThingName": "${data[${i}]['ThingName']}", "ThingIdentifier": "${data[${i}]['ThingIdentifier']}", "ThingSecret": "${data[${i}]['ThingSecret']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_IMPORTTHING}    ${headers}    ${valArrData}
	Log To Console    Response Import Thing : ${res}
	
	${data_countRes}=    Get Length    ${res}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
		# Log To Console    StatusDespcription${StatusDespcription}
	    Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${IMPORTTHING}
	#Exit For Loop
	END
	[return]    ${res}


#=====================================================================================================================================================#
Mapping IMEI
    [Arguments]    ${url}    ${accessToken}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_SIM3G}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}

    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}  
        #Log To Console    ${headers}

        #SupplierId SupplierName
        # ${random_number}=    generate random string    6    [NUMBERS]
        # ${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}
        #Log To Console    ${SupplierId}
        # ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}
        #Log To Console    ${SupplierName}

        ${body}=    Evaluate    { "ConnectivityType": "${data[${i}]['ConnectivityType']}", "ThingName": "${data[${i}]['ThingName']}", "ThingIdentifier": "${data[${i}]['ThingIdentifier']}", "ThingSecret": "${data[${i}]['ThingSecret']}", "IMEI": "${data[${i}]['IMEI']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	# Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_MAPPINGIMEI}    ${headers}    ${valArrData}
	Log To Console    Response Mapping IMEI : ${res}
    
	${data_countRes}=    Get Length    ${res}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
		# Log To Console    StatusDespcription${StatusDespcription}
	    Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${MAPPINGIMEI}
	#Exit For Loop
	END
	[return]    ${res}
#=====================================================================================================================================================#
Create A Whitelist
    [Arguments]    ${url}    ${accessToken}    ${data}    ${OwnerType}    ${OwnerId}    ${ThingIdentifierArr}
	
    Log To Console    DATA : : : :${data}

    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAWHITELIST}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAWHITELIST}
        #Log To Console    ${headers}

        ${body}=    Evaluate    {"OwnerType": "${OwnerType}","OwnerId": "${OwnerId}","ThingIdentifier": ["${ThingIdentifierArr}"]}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_CREATEAWHITELIST}    ${headers}    ${valArrData}
	Log To Console    Response Create A Whitelist : ${res}

   
    ${WhitelistInfo}=    Set Variable    ${res}[0] 
    ${OwnerId}=    Set Variable    ${WhitelistInfo['OwnerId']}
    ${OwnerType}=    Set Variable    ${WhitelistInfo['OwnerType']}
    ${ThingIdentifier}=    Set Variable    ${WhitelistInfo['ThingIdentifier']}
  

    
    ${data_countRes}=    Get Length    ${res}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
		# Log To Console    StatusDespcription${StatusDespcription}
        #Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${MAPPINGIMEI}
	#Exit For Loop
	END

	[return]    ${OwnerId}    ${OwnerType}    ${ThingIdentifier}    

#=====================================================================================================================================================#

Activate Things
    [Arguments]    ${url}    ${WorkerId}    ${ThingIdentifier}    ${ThingSecret}    ${imei}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS_CENTRIC}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_ACTIVATETHINGS_CENTRIC}
    #Log To Console    ${headers}

    ${data}=    Evaluate    [{ "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${imei}" }]
    #Log To Console    ${data}

	${replaceUrl}=    Replace String    ${URL_ACTIVATETHINGS_CENTRIC}    {WorkerId}    ${WorkerId}
	# Log To Console    ${replaceUrl}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${replaceUrl}    ${headers}    ${data}
	Log To Console    Response Activate Things : ${res}

    ${info}=    Set Variable    ${res}[0]    

    ${ThingIdentifier}=    Set Variable    ${info['ThingIdentifier']}    

    [return]    ${ThingIdentifier}

#=====================================================================================================================================================#
Imports list of Thing by WorkerId

    [Arguments]    ${url}    ${WorkerId}    ${body}    
    
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_IMPORTSLISTOFTHINGBYWORKERID}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_IMPORTSLISTOFTHINGBYWORKERID}
	#Log To Console    ${headers}
	
    #ThingName
    ${random_number}=    generate random string    8    [NUMBERS]
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
    Log To Console    ThingName is : ${ThingName}

	#data
    # [{"ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","CustomDetails":${CustomDetails},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}]		
    ${data}=    Evaluate    ${body} 
    # Log To Console    ${data}

    ${urlImportsListOfThingByWorkerId}=    Replace String    ${URL_IMPORTSLISTOFTHINGBYWORKERID}    WorkerId    ${WorkerId}
    # Log To Console    urlImportsListOfThingByWorkerId is : ${urlImportsListOfThingByWorkerId}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${urlImportsListOfThingByWorkerId}    ${headers}    ${data}
	Log To Console    Response Imports list of Thing by WorkerId : ${res}
	# Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${IMPORTSLISTOFTHINGBYWORKERID}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	Log To Console    body is : ${data}
    ${data_count}=    Get Length    ${data} 
    Log To Console    data_count is : ${data_count}
    # @{listAsString}=    Create List
    # ${StatusStatusDescription}=    Evaluate    {"Status":"${VALUE_LOG_CODE_20100}","StatusDescription":"${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}"}   
    # FOR    ${i}    IN RANGE    ${data_count}  
    #     Append To List    ${listAsString}   ${StatusStatusDescription}        #Add data to array set at valArrData    
    # END
    # Log To Console    listAsString is : ${listAsString}
    # #json.dumps use for parameter convert ' to "
    # ${expectResponse}=    Set Variable    json.dumps(${listAsString})    json
    ${dataExpectResponse}=    Set Variable If    '${data_count}'=='1'    {"Status":"${VALUE_LOG_CODE_20100}","StatusDescription":"${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}"}
    ...    '${data_count}'=='2'    {"Status":"${VALUE_LOG_CODE_20100}","StatusDescription":"${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}"},{"Status":"${VALUE_LOG_CODE_20100}","StatusDescription":"${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}"}
    
    ${expectResponse}    Evaluate    [${dataExpectResponse}]  
    Log To Console    expectResponse is : ${expectResponse}
	${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${IMPORTSLISTOFTHINGBYWORKERID}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
    Log To Console    checkReponse is : ${checkReponse}

	[return]    ${res}    ${WorkerId}    

#=====================================================================================================================================================#
Exports list of Things

    [Arguments]    ${url}    ${WorkerId}    
    
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_EXPORTSLISTOFTHINGBYWORKERID}
	#Log To Console    ${headers}
	
	#data
    ${data}=    Evaluate    {}
    # Log To Console    ${data}

    ${urlExportsListOfThingByWorkerId}=    Replace String    ${URL_EXPORTSLISTOFTHINGBYWORKERID}    WorkerId    ${WorkerId}
    # Log To Console    urlExportsListOfThingByWorkerId is : ${urlExportsListOfThingByWorkerId}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${urlExportsListOfThingByWorkerId}    ${headers}    ${data}
	Log To Console    Response Exports list of Things : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${EXPORTSLISTOFTHINGBYWORKERID}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	
    #ThingInfo
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
    # Log To Console    ThingInfo is : ${ThingInfo}	

    @{valArrThingId}=    Create List
    ${data_countThingInfo}=    Get Length    ${ThingInfo}
	# Log To Console    data_countThingInfo${data_countThingInfo}  
	FOR    ${i}    IN RANGE    ${data_countThingInfo}

        Append To List    ${valArrThingId}    ${ThingInfo[${i}]['${FIELD_THINGID}']}        #Add data to array set at valArrData         

    #Exit For Loop
	END
    # Log To Console    valArrThingId${valArrThingId}
    # [ThingIdArr]
	[return]    ${valArrThingId}

#=====================================================================================================================================================#
Assign Things to Workers

    [Arguments]    ${url}    ${WorkerId}    ${body}    
    
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_ASSIGNTHINGSTOWORKERS}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_ASSIGNTHINGSTOWORKERS}
	#Log To Console    ${headers}
	
	#data
    # [{,"ThingNameId":"${ThingNameId}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}"}]		
    ${data}=    Evaluate    ${body} 
    # Log To Console    data is : ${data}

    ${urlAssignThingsToWorkers}=    Replace String    ${URL_ASSIGNTHINGSTOWORKERS}    WorkerId    ${WorkerId}
    # Log To Console    urlAssignThingsToWorkers is : ${urlAssignThingsToWorkers}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${urlAssignThingsToWorkers}    ${headers}    ${data}
	Log To Console    Response Assign Things to Workers : ${res}

    ${data_count}=    Get Length    ${data} 
    Log To Console    data_count is : ${data_count}

    ${dataExpectResponse}=    Set Variable If    '${data_count}'=='1'    {"Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}"}
    ...    '${data_count}'=='2'    {"Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}"},{"Status":"${VALUE_LOG_CODE_20000}","StatusDescription":"${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}"}
    
    ${expectResponse}    Evaluate    [${dataExpectResponse}]  
    # Log To Console    expectResponse is : ${expectResponse}
	${checkReponse}=    Run keyword And Continue On Failure    Response Array Should Have    ${res}    ${ASSIGNTHINGSTOWORKERS}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}   ${expectResponse}
    Log To Console    checkReponse is : ${checkReponse}

	[return]    ${WorkerId}    

#=====================================================================================================================================================#
   
#Centric
Request CreateData for Signin Partner Account and CreateAThing 
    [Arguments]        ${username}    ${password}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ConnectivityType}    ${ThingState}
	${accessToken}=    Signin    ${URL}    ${username}    ${password}
	${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
	${postCreateAccount}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
   
    [return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[3]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[1]    ${postCreateAThingNotHaveWorkerId}[2]    ${postCreateAThingNotHaveWorkerId}[3]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]

#=====================================================================================================================================================#

Request CreateData for Signin Partner Account AThing And CreateWhitelist
    [Arguments]        ${username}    ${password}    ${data}    ${OwnerType}    ${OwnerIdType}    ${ThingIdentifierArr}    ${IMEI}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}

	${accessToken}=    Signin    ${URL}    ${username}    ${password}
	${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
	${postCreateAccount}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
 
    ${dataOwnerId}=    Set Variable If    '${OwnerIdType}'=='${TYPE_CUSTOMER}'    ${postCreatePartner}[3]
    ...    '${OwnerIdType}'=='${TYPE_TENANT}'    ${postCreatePartner}[0]
    ...    '${OwnerIdType}'=='${TYPE_ACCOUNT}'    ${postCreateAccount}[0]
    Log To Console    dataOwnerId:${dataOwnerId}    
    ${postCreateAWhitelist}=    Create A Whitelist    ${URL_CENTRIC}    ${accessToken}    ${data}    ${OwnerType}    ${dataOwnerId}    ${ThingIdentifier}
    Log To Console    postCreateAWhitelist: ${postCreateAWhitelist}

    #token,partnerId,CustomerId,AccountId,AccountName
    [return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[3]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[1]    ${postCreateAThingNotHaveWorkerId}[2]    ${postCreateAThingNotHaveWorkerId}[3]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]     ${postCreateAWhitelist}[0]    ${postCreateAWhitelist}[1]    ${postCreateAWhitelist}[2]    

#=====================================================================================================================================================#

Request CreateData for Signin Partner Account CreateAThing And Activate 
    [Arguments]        ${username}    ${password}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ConnectivityType}    ${ThingState}
	${accessToken}=    Signin    ${URL}    ${username}    ${password}
	${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
	${postCreateAccount}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
    
    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postCreateAThingHaveWorkerId}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${postCreateAWorker}[0]
    Log To Console    postCreateAThingHaveWorkerId :${postCreateAThingHaveWorkerId}

    ${postActivateThings}=    Activate Things    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postActivateThings :${postActivateThings}
   
    [return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[3]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreateAThingHaveWorkerId}[0]    ${postActivateThings}   


#=====================================================================================================================================================#

Request CreateData for Signin Partner Account CreateAThing CreateWhitelist And Activate 
    [Arguments]        ${username}    ${password}    ${data}    ${data2}    ${OwnerType}    ${OwnerIdType}    ${IMEI}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI2}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}

	${accessToken}=    Signin    ${URL}    ${username}    ${password}

	${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
	${postCreateAccount}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    ${postCreateAThingHaveWorkerId}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${postCreateAWorker}[0]
    ${dataOwnerId}=    Set Variable If    '${OwnerIdType}'=='${TYPE_CUSTOMER}'    ${postCreatePartner}[3]
    ...    '${OwnerIdType}'=='${TYPE_TENANT}'    ${postCreatePartner}[0]
    ...    '${OwnerIdType}'=='${TYPE_ACCOUNT}'    ${postCreateAccount}[0]
    Log To Console    dataOwnerId:${dataOwnerId}   
    ${postCreateAWhitelist}=    Create A Whitelist    ${URL_CENTRIC}    ${accessToken}    ${data}    ${OwnerType}    ${dataOwnerId}    ${ThingIdentifier}
    Log To Console    postCreateAWhitelist: ${postCreateAWhitelist}
    ${postActivateThings}=    Activate Things    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postActivateThings :${postActivateThings}


    ${postCreatePartner2}=    Create Partner    ${URL}    ${accessToken}
    ${postCreateAccount2}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner2}[0]    ${postCreatePartner2}[1]
    ${postCreateAWorker2}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    ${postCreateAThingHaveWorkerId2}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}    ${postCreateAWorker2}[0]
    ${dataOwnerId2}=    Set Variable If    '${OwnerIdType}'=='${TYPE_CUSTOMER}'    ${postCreatePartner2}[3]
    ...    '${OwnerIdType}'=='${TYPE_TENANT}'    ${postCreatePartner2}[0]
    ...    '${OwnerIdType}'=='${TYPE_ACCOUNT}'    ${postCreateAccount2}[0]
    Log To Console    dataOwnerId2:${dataOwnerId2}   
    ${postCreateAWhitelist2}=    Create A Whitelist    ${URL_CENTRIC}    ${accessToken}    ${data2}    ${OwnerType}    ${dataOwnerId2}    ${ThingIdentifier2}
    Log To Console    postCreateAWhitelist2: ${postCreateAWhitelist2}


    # #token,partnerId,CustomerId,AccountId,AccountName,Ownertype,OwnerId,Thingidentifier,workerid,thingid,imei,thigidentifier,thingsecreat
    [return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[3]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreateAWhitelist}[0]    ${postCreateAWhitelist}[1]    ${postCreateAWhitelist}[2]    ${postCreatePartner2}[0]    ${postCreatePartner2}[3]    ${postCreateAccount2}[0]    ${postCreateAccount2}[1]    ${postCreateAWhitelist2}[0]    ${postCreateAWhitelist2}[1]    ${postCreateAWhitelist2}[2]    ${postCreateAThingHaveWorkerId}[0]    ${postCreateAThingHaveWorkerId2}[0]         





#=====================================================================================================================================================#

Request CreateData for CreateAWorker And CreateAThing
    [Arguments]        ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postCreateAThingHaveWorkerId}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${postCreateAWorker}[0]
    Log To Console    postCreateAThingHaveWorkerId :${postCreateAThingHaveWorkerId}

    [return]    ${postCreateAWorker}[0]    ${postCreateAThingHaveWorkerId}[0]    ${postCreateAThingHaveWorkerId}[4]    ${postCreateAThingHaveWorkerId}[5]    ${postCreateAThingHaveWorkerId}[6]    


Request CreateData for CreateAWorker And CreateAThing2
    [Arguments]        ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}    

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postCreateAThingHaveWorkerId}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${postCreateAWorker}[0]
    Log To Console    postCreateAThingHaveWorkerId :${postCreateAThingHaveWorkerId}
    Sleep    3s
    ${postCreateAThingHaveWorkerId2}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}    ${postCreateAWorker}[0]
    Log To Console    postCreateAThingHaveWorkerId2 :${postCreateAThingHaveWorkerId2}

    [return]    ${postCreateAWorker}[0]    ${postCreateAThingHaveWorkerId}[0]    ${postCreateAThingHaveWorkerId}[4]    ${postCreateAThingHaveWorkerId}[5]    ${postCreateAThingHaveWorkerId}[6]    ${postCreateAThingHaveWorkerId2}[0]    ${postCreateAThingHaveWorkerId2}[4]    ${postCreateAThingHaveWorkerId2}[5]    ${postCreateAThingHaveWorkerId2}[6]



Request CreateData for CreateAWorker And CreateAThing No Have WorkerId
    [Arguments]        ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postCreateAThingNotHaveWorkerId :${postCreateAThingNotHaveWorkerId}



    [return]    ${postCreateAWorker}[0]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]    ${postCreateAThingNotHaveWorkerId}[6]




Request CreateData for CreateAWorker And CreateAThingNotHaveWorkerId2
    [Arguments]        ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}    

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    
    Log To Console    postCreateAThingNotHaveWorkerId :${postCreateAThingNotHaveWorkerId}
    Sleep    3s
    ${postCreateAThingNotHaveWorkerId2}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}    
    Log To Console    postCreateAThingNotHaveWorkerId2 :${postCreateAThingNotHaveWorkerId2}

    [return]    ${postCreateAWorker}[0]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]    ${postCreateAThingNotHaveWorkerId}[6]    ${postCreateAThingNotHaveWorkerId2}[0]    ${postCreateAThingNotHaveWorkerId2}[4]    ${postCreateAThingNotHaveWorkerId2}[5]    ${postCreateAThingNotHaveWorkerId2}[6]



Request CreateData for CreateAWorker And ImportThing
    [Arguments]        ${data}    

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postImportThing}=	   Import Thing    ${URL_CENTRIC}    null    ${data}
    Log To Console    postImportThing${postImportThing}    

    [return]    ${postCreateAWorker}[0]    


Request CreateData for CreateAWorker And CreateAThing No Have WorkerId And ActivateThings
    [Arguments]        ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postCreateAThingNotHaveWorkerId :${postCreateAThingNotHaveWorkerId}

    ${postActivateThings}=    Activate Things    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postActivateThings :${postActivateThings}


    [return]    ${postCreateAWorker}[0]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]    ${postCreateAThingNotHaveWorkerId}[6]



Request CreateData for CreateAWorker And CreateAThingNotHaveWorkerId3Data And ActivateThings3Data
    [Arguments]        ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}   ${ConnectivityType3}    ${ThingState3}    ${ThingIdentifier3}    ${ThingSecret3}    ${IMEI3}    

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${VALUE_SERVERIP}    ${VALUE_SERVERPORT}    ${VALUE_SERVERDOMAIN}    ${VALUE_WORKERSTATE_TERMINATED}
    Log To Console    postCreateAWorker :${postCreateAWorker}

    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    
    Log To Console    postCreateAThingNotHaveWorkerId :${postCreateAThingNotHaveWorkerId}
    Sleep    3s
    ${postCreateAThingNotHaveWorkerId2}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType2}    ${ThingState2}    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}    
    Log To Console    postCreateAThingNotHaveWorkerId2 :${postCreateAThingNotHaveWorkerId2}
    Sleep    3s
    ${postCreateAThingNotHaveWorkerId3}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType3}    ${ThingState3}    ${ThingIdentifier3}    ${ThingSecret3}    ${IMEI3}    
    Log To Console    postCreateAThingNotHaveWorkerId3 :${postCreateAThingNotHaveWorkerId3}
    Sleep    3s
    ${postActivateThings}=    Activate Things    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    Log To Console    postActivateThings :${postActivateThings}
    Sleep    3s
    ${postActivateThings2}=    Activate Things    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${ThingIdentifier2}    ${ThingSecret2}    ${IMEI2}
    Log To Console    postActivateThings2 :${postActivateThings2}
    Sleep    3s
    ${postActivateThings3}=    Activate Things    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${ThingIdentifier3}    ${ThingSecret3}    ${IMEI3}
    Log To Console    postActivateThings3 :${postActivateThings3}

    [return]    ${postCreateAWorker}[0]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]    ${postCreateAThingNotHaveWorkerId}[6]    ${postCreateAThingNotHaveWorkerId2}[0]    ${postCreateAThingNotHaveWorkerId2}[4]    ${postCreateAThingNotHaveWorkerId2}[5]    ${postCreateAThingNotHaveWorkerId2}[6]    ${postCreateAThingNotHaveWorkerId3}[0]    ${postCreateAThingNotHaveWorkerId3}[4]    ${postCreateAThingNotHaveWorkerId3}[5]    ${postCreateAThingNotHaveWorkerId3}[6]



#=====================================================================================================================================================#

Request CreateData for CreateAWorker ImportsListOfThingByWorkerId and ExportsListOfThings
    [Arguments]    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${dataCreateThing}

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    ${postImportsListOfThingByWorkerId}=    Imports list of Thing by WorkerId    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${dataCreateThing}
    ${postExportsListOfThings}=    Exports list of Things    ${URL_CENTRIC}    ${postCreateAWorker}[0]

    #WorkerId,WorkerName,thingIdArr,responseImportsListOfThingByWorkerIdArray
    [return]    ${postCreateAWorker}[0]    ${postCreateAWorker}[1]    ${postExportsListOfThings}    ${postImportsListOfThingByWorkerId}[0]

#=====================================================================================================================================================#

Request CreateData for CreateAWorker and ImportsListOfThingByWorkerId
    [Arguments]    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${dataCreateThing}

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    ${postImportsListOfThingByWorkerId}=    Imports list of Thing by WorkerId    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${dataCreateThing}
    
    #WorkerId,WorkerName,responseImportsListOfThingByWorkerIdArray
    [return]    ${postCreateAWorker}[0]    ${postCreateAWorker}[1]    ${postImportsListOfThingByWorkerId}[0]

#=====================================================================================================================================================#

Request CreateData for CreateAWorker and CreateAThingNotHaveWorkerId
    [Arguments]    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}

    #WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName
    [return]    ${postCreateAWorker}[0]    ${postCreateAWorker}[1]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]    ${postCreateAThingNotHaveWorkerId}[6]

#=====================================================================================================================================================#

Request CreateData for CreateAWorker and CreateAThingHaveWorkerId
    [Arguments]    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    ${postCreateAThingHaveWorkerId}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${postCreateAWorker}[0]

    #WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName
    [return]    ${postCreateAWorker}[0]    ${postCreateAWorker}[1]    ${postCreateAThingHaveWorkerId}[0]    ${postCreateAThingHaveWorkerId}[4]    ${postCreateAThingHaveWorkerId}[5]    ${postCreateAThingHaveWorkerId}[6]

#=====================================================================================================================================================#

Request CreateData for CreateAWorker CreateAWorker2 CreateAThingNotHaveWorkerId and AssignThingsToWorkers
    [Arguments]    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    ${postCreateAWorker2}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    
    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    
    ${data}=    Set Variable    [{"ThingId":"${postCreateAThingNotHaveWorkerId}[0]","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}"}]		
    ${postAssignThingsToWorkers}=    Assign Things to Workers    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${data}    

    #WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName,WorkerId2,WorkerName2,dataAssignThingsToWorkers
    [return]    ${postCreateAWorker}[0]    ${postCreateAWorker}[1]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]    ${postCreateAThingNotHaveWorkerId}[6]    ${postCreateAWorker2}[0]    ${postCreateAWorker2}[1]    ${data}

#=====================================================================================================================================================#

Request CreateData for CreateAWorker CreateAThingNotHaveWorkerId and AssignThingsToWorkers
    [Arguments]    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}

    ${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}
    ${postCreateAThingNotHaveWorkerId}=    Create A Thing Not Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType}    ${ThingState}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}
    
    ${data}=    Set Variable    [{"ThingId":"${postCreateAThingNotHaveWorkerId}[0]","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}"}]		
    ${postAssignThingsToWorkers}=    Assign Things to Workers    ${URL_CENTRIC}    ${postCreateAWorker}[0]    ${data}    

    #WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName,dataAssignThingsToWorkers
    [return]    ${postCreateAWorker}[0]    ${postCreateAWorker}[1]    ${postCreateAThingNotHaveWorkerId}[0]    ${postCreateAThingNotHaveWorkerId}[4]    ${postCreateAThingNotHaveWorkerId}[5]    ${postCreateAThingNotHaveWorkerId}[6]    ${data}

#=====================================================================================================================================================#

Request CreateData for ImportThing MappingIMEI
    [Arguments]    ${data_import}    ${data_mappin_imei}  

    ${postCreateAWorker}=	   Import Thing    ${URL_CENTRIC}    null    ${data_import}
    Log    ${postCreateAWorker}
    ${postMappingIMEI}=	   Mapping IMEI    ${URL_CENTRIC}    null    ${data_mappin_imei}
    Log    ${postMappingIMEI}
    #WorkerId,WorkerName,ThingId,ThingName,SupplierId,SupplierName
    #[return] 




