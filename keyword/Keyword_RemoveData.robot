*** Keywords ***
Remove Partner
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEPARTNER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEPARTNER}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerId": "${PartnerId}"}   
    #Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVEPARTNER}    ${headers}    ${data}
	Log To Console    RemovePartner Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEPARTNER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    Log To Console    RemovePartner Result : ${result}
	[return]    ${result}

Remove Account
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}    ${AccountId}
	Log    ${url}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNT}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerID": "${PartnerId}","AccountId": "${AccountId}"}   
    Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVEACCOUNT}    ${headers}    ${data}
	Log To Console    RemoveAccount Response : ${res}

	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEACCOUNT}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    Log To Console    RemoveAccount Result : ${result}
	[return]    ${result}

Delete A Thing
    [Arguments]    ${url}    ${ThingId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEATHING}
	#Log To Console    ${headers}

    ${res}=    Delete Api Request Not Data    ${url}${CENTRICAPIS}    ${URL_REMOVEATHING}${ThingId}    ${headers}
	Log To Console    Delete A Thing Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEATHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	Log To Console    Delete A Thing Result : ${result}
	[return]    ${result}

Delete A Worker
    [Arguments]    ${url}    ${WorkerId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAWORKER}  
	#Log To Console    ${headers}
		
    ${res}=    Delete Api Request Not Data    ${url}${CENTRICAPIS}    ${URL_DELETEAWORKER}${WorkerId}    ${headers}
	Log To Console    Delete A Worker Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${DELETEAWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	Log To Console    Delete A Worker Result : ${result}
	[return]    ${result}

Delete A Whitelist
    [Arguments]    ${url}    ${accessToken}    ${OwnerId}    ${ThingIdentifier}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAWHITELIST}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAWHITELIST}  
	Log To Console    ThingIdentifierThingIdentifier${ThingIdentifier}

	# {"ThingIdentifier": ["${ThingIdentifier}"]}
	${data}=    Evaluate    {"ThingIdentifier":["${ThingIdentifier}"]}
    Log To Console    ${data}
    
	${replaceUrl}=    Replace String    ${URL_DELETEAWHITELIST}    [OwnerId]    ${OwnerId}

    ${res}=    Delete Api Request    ${url}${CENTRICAPIS}    ${replaceUrl}    ${headers}    ${data}
	Log To Console    Delete A Whitelist Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${DELETEAWHITELIST}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	Log To Console    Delete A Whitelist Result : ${result}
	[return]    ${result}

Request RemoveData Partner Account and AThing
	[Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}    ${AThingId}
		
	${postRemoveAThing}=    Delete A Thing    ${URL_CENTRIC}    ${AThingId}
	Log To Console    postRemoveAThing: :${postRemoveAThing} 
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	Log To Console    postRemoveAccount: :${postRemoveAccount} 
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}
	Log To Console    postRemovePartner: :${postRemovePartner} 

	${result}=    Set Variable If    '${postRemoveAThing}'=='true' and '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true'    True
    ...     '${postRemoveAThing}'!='true' and '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true'    False
    Log To Console    Request RemoveData Partner Account and AThing : ${result}
	[return]    ${result}


Request RemoveData Partner Account AThing and Whitelist
	[Arguments]    ${accessToken}    ${PartnerId}    ${CustomerId}    ${AccountId}    ${AThingId}    ${ThingIdentifier}    ${OwnerId}

	${postRemoveAWhitelist}=    Delete A Whitelist    ${URL_CENTRIC}    ${accessToken}    ${OwnerId}    ${ThingIdentifier}    
	Log To Console    postRemoveAWhitelist: :${postRemoveAWhitelist} 
	${postRemoveAThing}=    Delete A Thing    ${URL_CENTRIC}    ${AThingId}
	Log To Console    postRemoveAThing: :${postRemoveAThing} 
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	Log To Console    postRemoveAccount: :${postRemoveAccount} 
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}
	Log To Console    postRemovePartner: :${postRemovePartner} 

	${result}=    Set Variable If    '${postRemoveAThing}'=='true' and '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true'    True
    ...     '${postRemoveAThing}'!='true' and '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true'    False
    Log To Console    Request RemoveData Partner Account and AThing : ${result}
	[return]    ${result}

Request RemoveData Partner Account AThing
	[Arguments]    ${accessToken}    ${PartnerId}    ${CustomerId}    ${AccountId}    ${AThingId}    

	${postRemoveAThing}=    Delete A Thing    ${URL_CENTRIC}    ${AThingId}
	Log To Console    postRemoveAThing: :${postRemoveAThing} 
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	Log To Console    postRemoveAccount: :${postRemoveAccount} 
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}
	Log To Console    postRemovePartner: :${postRemovePartner} 

	${result}=    Set Variable If    '${postRemoveAThing}'=='true' and '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true'    True
    ...     '${postRemoveAThing}'!='true' and '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true'    False
    Log To Console    Request RemoveData Partner Account and AThing : ${result}
	[return]    ${result}

Request RemoveData DeleteAWorker
	[Arguments]    ${WorkerId}    

	${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${WorkerId}

	${result}=    Set Variable If    '${postDeleteAWorker}'=='true'    True
    ...     '${postDeleteAWorker}'!='true'    False
    Log To Console    Request RemoveData DeleteAWorker : ${result}
	
	[return]    ${result}

Request RemoveData DeleteAWorker2
	[Arguments]    ${WorkerIdArr}    

	${data_count}=    Get Length    ${WorkerIdArr}
	# Log To Console    data_count${data_count}  
	FOR    ${i}    IN RANGE    ${data_count}
       ${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${WorkerIdArr}[${i}]  
	END

	${result}=    Set Variable If    '${postDeleteAWorker}'=='true'    True
    ...     '${postDeleteAWorker}'!='true'    False
    Log To Console    Request RemoveData DeleteAWorker : ${result}
	
	[return]    ${result}

Request RemoveData DeleteAWorker and DeleteAThingArr
	[Arguments]    ${thingIdArr}    ${workerId}    

    ${data_count}=    Get Length    ${thingIdArr}
	# Log To Console    data_count${data_count}  
	FOR    ${i}    IN RANGE    ${data_count}
       ${postDeleteAThing}=    Delete A Thing    ${URL_CENTRIC}    ${thingIdArr}[${i}]  
	END
	${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${workerId} 
	
	${result}=    Set Variable If    '${postDeleteAWorker}'=='true' and '${postDeleteAThing}'=='true'    True
    ...     '${postDeleteAWorker}'!='true' and '${postDeleteAThing}'!='true'    False
    Log To Console    Request RemoveData DeleteAWorker and DeleteAThingArr : ${result}
	
	[return]    ${result}

Request RemoveData DeleteAWorkerArr and DeleteAThingArr
	[Arguments]    ${thingIdArr}    ${workerIdArr}    

    ${data_countThing}=    Get Length    ${thingIdArr}
	Log To Console    data_countThing${data_countThing}  
	FOR    ${i}    IN RANGE    ${data_countThing}
       ${postDeleteAThing}=    Delete A Thing    ${URL_CENTRIC}    ${thingIdArr}[${i}]  
	END

	${data_countWorker}=    Get Length    ${workerIdArr}
	Log To Console    data_countWorker${data_countWorker}  
	FOR    ${j}    IN RANGE    ${data_countWorker}
	    ${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${workerIdArr}[${j}]  
	END

	${result}=    Set Variable If    '${postDeleteAWorker}'=='true' and '${postDeleteAThing}'=='true'    True
    ...     '${postDeleteAWorker}'!='true' and '${postDeleteAThing}'!='true'    False
    Log To Console    Request RemoveData DeleteAWorkerArr and DeleteAThingArr : ${result}
	
	[return]    ${result}

Request RemoveData Worker and AThing
	[Arguments]    ${WorkId}    ${AThingId} 

    ${postRemoveAThing}=    Delete A Thing    ${URL_CENTRIC}    ${AThingId} 
	${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${WorkId}
	
	${result}=    Set Variable If    '${postRemoveAThing}'=='true' and '${postDeleteAWorker}'=='true'     True
    ...     '${postRemoveAThing}'!='true' and '${postDeleteAWorker}'!='true'    False
    Log To Console    Request RemoveData Worker and AThing : ${result}
	
	[return]    ${result}


Request RemoveData Worker and AThing2DATA
	[Arguments]    ${WorkId}    ${AThingIdArr} 

      
	${data_count}=    Get Length    ${AThingIdArr}  
	FOR    ${i}    IN RANGE    ${data_count}
       ${postRemoveAThing}=    Delete A Thing    ${URL_CENTRIC}    ${AThingIdArr}[${i}]  
	END

	${postDeleteAWorker}=    Delete A Worker    ${URL_CENTRIC}    ${WorkId}
	Log To Console    postDeleteAWorker: :${postDeleteAWorker} 

	${result}=    Set Variable If    '${postRemoveAThing}'=='true' and '${postDeleteAWorker}'=='true'     True
    ...     '${postRemoveAThing}'!='true' and '${postDeleteAWorker}'!='true'    False
    Log To Console    Request RemoveData Worker and AThing : ${result}
	
	[return]    ${result}


Request RemoveData AThing Only
	[Arguments]    ${AThingId} 
    ${postRemoveAThing}=    Delete A Thing    ${URL_CENTRIC}    ${AThingId} 

	${result}=    Set Variable If    '${postRemoveAThing}'=='true'    True
    ...     '${postRemoveAThing}'!='true'   False
    Log To Console    Request RemoveData AThing only : ${result}
	
	[return]    ${result}

Request RemoveData DeleteAThingArr
	[Arguments]    ${thingArr}

    ${data_count}=    Get Length    ${thingArr}
	# Log To Console    data_count${data_count}  
	FOR    ${i}    IN RANGE    ${data_count}
       ${postDeleteAThing}=    Delete A Thing    ${URL_CENTRIC}    ${ThingArr}[${i}]  
	END

	${result}=    Set Variable If    '${postDeleteAThing}'=='true'    True
    ...    False
    Log To Console    Request RemoveData DeleteAThingArr : ${result}
	
	[return]    ${result}



Request RemoveData Partner Account AThing Array
	[Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}    ${AThingId}    ${PartnerId2}    ${AccountId2}    ${AThingId2}

	${postRemoveAThing}=    Delete A Thing    ${URL_CENTRIC}    ${AThingId}
	Log To Console    postRemoveAThing: :${postRemoveAThing} 
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	Log To Console    postRemoveAccount: :${postRemoveAccount} 
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}
	Log To Console    postRemovePartner: :${postRemovePartner} 

	Sleep    3s
	
	${postRemoveAThing2}=    Delete A Thing    ${URL_CENTRIC}    ${AThingId2}
	Log To Console    postRemoveAThing2: :${postRemoveAThing2} 
	${postRemoveAccount2}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId2}    ${AccountId2}
	Log To Console    postRemoveAccount2: :${postRemoveAccount2} 
	${postRemovePartner2}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId2}
	Log To Console    postRemovePartner2: :${postRemovePartner2}

	${result}=    Set Variable If    '${postRemoveAThing}'=='true' and '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true' and'${postRemoveAThing2}'=='true' and '${postRemoveAccount2}'=='true' and '${postRemovePartner2}'=='true'    True
    ...     '${postRemoveAThing}'!='true' and '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true' and '${postRemoveAThing2}'!='true' and '${postRemoveAccount2}'!='true' and '${postRemovePartner2}'!='true'    False
    Log To Console    Request RemoveData Partner Account and AThing Array: ${result}
	[return]    ${result}