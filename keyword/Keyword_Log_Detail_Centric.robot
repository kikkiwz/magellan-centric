*** Keywords ***	
################################################################-- Do Not Have EndPointName --################################################################
#-------------------------------------------- Whitelist --------------------------------------------#	
#-------------------------------------------- CreateWhitelist : RequestObject --------------------------------------------#	
Check RequestObject App Success CreateWhitelist	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}
	Log To Console    Check RequestObject App Success CreateWhitelist

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	
	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CREATEWHITELIST}    [valuePathUrl]    ${pathUrl}    
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replaceBody}=    Replace String    ${replaceUserAgent}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

#============================================================== ResponseObject CreateWhitelist Success ===============================================================================================#
Check ResponseObject App Success CreateAWhitelist	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${response}    ${body}    ${accessToken}
	Log To Console    Check ResponseObject App Success CreateAWhitelist 

	${custom1}=    Set Variable    ${dataResponse['custom1']}   
	${DataresponseObject}=    Set Variable    ${custom1['responseObject']} 
	${responseInfo}=    Evaluate    json.loads(r'''${DataresponseObject}''')    json
	${Info}=    Set Variable    ${responseInfo}[0] 

	${OwnerType}=    Set Variable    ${Info['OwnerType']} 
	Log To Console    OwnerType :${OwnerType}    
	${OwnerId}=    Set Variable    ${Info['OwnerId']} 
	Log To Console    OwnerId :${OwnerId}
	${ThingIdentifier}=    Set Variable    ${Info['ThingIdentifier']} 
	Log To Console    ThingIdentifier :${ThingIdentifier}   
	${GetThingIden}=    Set Variable    ${ThingIdentifier}  
	Log To Console    GetThingIden :${GetThingIden}      
	${resp_json}=    Evaluate    json.loads(r'''${GetThingIden}''')    json
 	Log To Console    resp_json${resp_json}

	${ReplaceThingIdentifier}=    Set Variable    [\\"${resp_json[0]}\\"]

	${replaceDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST}    [StatusDescription]    ${description}  
	${replaceCode}=    Replace String    ${replaceDescription}    [Status]    ${code}
	Log To Console    replaceCode :${replaceCode}
	${replaceThingIdentifier}=    Replace String    ${replaceCode}    [ThingIdentifier]    ${ReplaceThingIdentifier}
	Log To Console    replaceThingIdentifier :${replaceThingIdentifier}
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifier}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${responseObject}=    Replace String To Object    ${replaceOwnerType}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}
#=================================================================================================================================================================================================================================#

#============================================================== ResponseObject CreateWhitelist Error ===============================================================================================#
Check ResponseObject App Success CreateAWhitelist Error  	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}
	Log To Console    Check ResponseObject App Success CreateAWhitelist Error 

	${custom1}=    Set Variable    ${dataResponse['custom1']}   
	${DataresponseObject}=    Set Variable    ${custom1['responseObject']} 
	${responseInfo}=    Evaluate    json.loads(r'''${DataresponseObject}''')    json
	${Info}=    Set Variable    ${responseInfo}[0] 
	${ThingIdentifierAlreadyExists}=    Set Variable    ${Info['ThingIdentifierAlreadyExists']} 
	Log To Console    ThingIdentifierAlreadyExists :${ThingIdentifierAlreadyExists}

	${OwnerType}=    Set Variable    ${Info['OwnerType']} 
	Log To Console    OwnerType :${OwnerType}    
	${OwnerId}=    Set Variable    ${Info['OwnerId']} 
	Log To Console    OwnerId :${OwnerId}
	${ThingIdentifier}=    Set Variable    ${Info['ThingIdentifier']} 
	Log To Console    ThingIdentifier :${ThingIdentifier}   
	${GetThingIden}=    Set Variable    ${ThingIdentifier}  
	Log To Console    GetThingIden :${GetThingIden}      
	${resp_json}=    Evaluate    json.loads(r'''${GetThingIden}''')    json
 	Log To Console    resp_json${resp_json}
	
	${ReplaceThingIdentifier}=    Set Variable If    '${ThingIdentifier}'!='null' and '${ThingIdentifier}'!='[]'     [\\"${resp_json[0]}\\"]  
	...    '${ThingIdentifier}'=='null'    null
	...    '${ThingIdentifier}'=='[]'    []
	Log To Console    ReplaceThingIdentifier:${ReplaceThingIdentifier}

	${ReplaceThingIdentifierAlreadyExists}=    Set Variable If    '${ThingIdentifierAlreadyExists}'=='None'    null 
	...    '${ThingIdentifierAlreadyExists}'!='None'    ${ThingIdentifierAlreadyExists}
	Log To Console    ReplaceThingIdentifierAlreadyExists:${ReplaceThingIdentifierAlreadyExists}

	${ReplaceOwnerId}=    Set Variable If    '${OwnerId}'=='None'    null 
	...    '${OwnerId}'!='None'    "${OwnerId}"
	Log To Console    ReplaceOwnerId:${ReplaceOwnerId}

	${ReplaceOwnerType}=    Set Variable If    '${OwnerType}'=='None'    null 
	...    '${OwnerType}'!='None'    "${OwnerType}"
	Log To Console    ReplaceOwnerType:${ReplaceOwnerType}

	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST_ERROR}    [StatusDescription]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Status]    ${code}
	${replaceIden}=    Replace String    ${replaceStatus}    [ThingIdentifier]    ${ReplaceThingIdentifier} 
	${replaceIdentifierAlreadyExists}=    Replace String    ${replaceIden}    [ThingIdentifierAlreadyExists]    ${ReplaceThingIdentifierAlreadyExists} 
	${replaceOwnerId}=    Replace String    ${replaceIdentifierAlreadyExists}    [OwnerId]    ${ReplaceOwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${ReplaceOwnerType}
	${responseObject}=    Replace String To Object    ${replaceOwnerType}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

Check ResponseObject App Success CreateAWhitelist Error2 	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}
	Log To Console    Check ResponseObject App Success CreateAWhitelist Error2    

	${WhitelistInfo}=    Set Variable    ${response}[0]  
	${OwnerType}=    Set Variable    ${WhitelistInfo['OwnerType']}  
	${OwnerId}=    Set Variable    ${WhitelistInfo['OwnerId']} 
	${ThingIdentifierAlreadyExists}=    Set Variable    ${WhitelistInfo['ThingIdentifierAlreadyExists']} 
	${GetThingIden}=    Set Variable    ${ThingIdentifierAlreadyExists}      
	${resp_json}=    Evaluate    json.loads(r'''${GetThingIden}''')    json
 
	${ReplaceThingIdentifierAlreadyExists}=    Set Variable    [\\"${resp_json[0]}\\"]
	Log To Console    ReplaceThingIdentifierAlreadyExists${ReplaceThingIdentifierAlreadyExists}


	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST_ERROR2}    [StatusDescription]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Status]    ${code}
	${replaceThingIdentifierAlreadyExists}=    Replace String    ${replaceStatus}    [ThingIdentifierAlreadyExists]    ${ReplaceThingIdentifierAlreadyExists}
	Log To Console    replaceStatus replaceStatus${replaceThingIdentifierAlreadyExists}
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifierAlreadyExists}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${responseObject}=    Replace String To Object    ${replaceOwnerType}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}
#============================================================== RequestObject UpdateAWhitelist ===============================================================================================#
Check RequestObject App Success UpdateAWhitelist	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}


	${routeParameters}=    Set Variable If    '${pathUrl}'=='${URL_UPDATEAWHITELIST_MISSINGOWNERID}'    ${EMPTY}         
	...    '${pathUrl}'!='${URL_UPDATEAWHITELIST_MISSINGOWNERID}'    "routeParameters":{"OwnerId":"[OwnerId]"},     

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${OwnerId}=    Set Variable    ${resp_jsonReq['routeParameters']['OwnerId']}

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_UPDATEAWHITELIST}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replacerouteParameters}=    Replace String    ${replaceUserAgent}    [routeParameters]    ${routeParameters}
	${replaceOwnerId}=    Replace String    ${replacerouteParameters}    [OwnerId]    ${OwnerId}
	${replaceBody}=    Replace String    ${replaceOwnerId}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

#============================================================== ResponseObject UpdateAWhitelist ===============================================================================================#
Check ResponseObject App Success UpdateAWhitelist	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}

	${WhitelistInfo}=    Set Variable    ${response['WhitelistInfo']} 
	${ThingIdentifier}=    Set Variable    ${WhitelistInfo['ThingIdentifier']}     
	${OwnerId}=    Set Variable    ${WhitelistInfo['OwnerId']}    
	${OwnerType}=    Set Variable    ${WhitelistInfo['OwnerType']} 
	${WhitelistId}=    Set Variable    ${WhitelistInfo['WhitelistId']} 


	${replaceDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_UPDATEAWHITELIST}    [DeveloperMessage]    ${description}  
	${replaceCode}=    Replace String    ${replaceDescription}    [Code]    ${code}
	${replaceThingIdentifier}=    Replace String    ${replaceCode}    [ThingIdentifier]    ${ThingIdentifier}[0]
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifier}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${replaceWhitelistId}=    Replace String    ${replaceOwnerType}    [WhitelistId]    ${WhitelistId}
	${responseObject}=    Replace String To Object    ${replaceWhitelistId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

#=================================================================================================================================================================================================================================#
#============================================================== RequestObject DeleteAWhitelist ===============================================================================================#

Check RequestObject App Success DeleteAWhitelist	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}

	${ForReplacerouteParameters}=    Set Variable If    '${pathUrl}'=='${URL_DELETEAWHITELIST_MISSINGOWNERID}'    ${EMPTY}         
	...    '${pathUrl}'!='${URL_DELETEAWHITELIST_MISSINGOWNERID}'    "routeParameters":{"OwnerId":"[OwnerId]"},
    

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${OwnerId}=    Set Variable    ${resp_jsonReq['routeParameters']['OwnerId']}

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETEAWHITELIST}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}   
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for} 
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}   
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}  
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId} 
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replaceRouteParameters}=    Replace String    ${replaceUserAgent}    [routeParameters]    ${ForReplacerouteParameters} 
	${replaceOwnerId}=    Replace String    ${replaceRouteParameters}    [OwnerId]    ${OwnerId}
	${replaceBody}=    Replace String    ${replaceOwnerId}    [body]    ${body} 
	${requestObject}=    Replace String To Object    ${replaceBody}
	Log To Console    requestObject:${requestObject}   
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

#=================================================================================================================================================================================================================================#

#============================================================== RequestObject Return A list Of Whitelist ===============================================================================================#
Check RequestObject App Success Return A list Of Whitelist 	
	[Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}

 

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${queryString}=    Set Variable    ${resp_jsonReq['queryString']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_RETURNSALISTOFWHITELIST}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${requestObject}=    Replace String To Object    ${replaceUserAgent}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

Check RequestObject App Success RouteNotFound	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}

	${GetLength_Tid}=    Get Length    ${tid}  
	Log To Console    GetLength_Tid${GetLength_Tid} 

	${VALUE_LOG}=    Set Variable If    '${GetLength_Tid}'=='34'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETEAWHITELIST_MISSING}    
	...    '${GetLength_Tid}'=='35'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_UPDATEAWHITELIST_MISSING} 
	...    '${GetLength_Tid}'=='33'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_VERIFIESTHINGS}   


	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}

	${replaceUrl}=    Replace String    ${VALUE_LOG}    [valuePathUrl]    ${pathUrl}  
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for} 
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replaceBody}=    Replace String    ${replaceUserAgent}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

#============================================================== RequestObject Get A Whitelist By Thing Identifier ===============================================================================================#

Check RequestObject App Success Get A Whitelist By Thing Identifier 	
	[Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}



	${routeParameters}=    Set Variable If    '${pathUrl}'=='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'    ${EMPTY}         
	...    '${pathUrl}'!='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'    ,"routeParameters":{"ThingIdentifier":"[ThingIdentifier]"} 

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
 
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${queryString}=    Set Variable    ${resp_jsonReq['queryString']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${ThingIdentifier}=    Set Variable If    '${pathUrl}'!='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'     ${resp_jsonReq['routeParameters']['ThingIdentifier']}
	...    '${pathUrl}'=='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'    ${EMPTY}    

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replaceRouteParameters}=    Replace String    ${replaceUserAgent}    [routeParameters]    ${routeParameters}
	${replaceThingIdentifier}=    Replace String    ${replaceRouteParameters}    [ThingIdentifier]    ${ThingIdentifier}
	${requestObject}=    Replace String To Object    ${replaceThingIdentifier}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

Check RequestObject RouteNotFound Get A Whitelist By Thing Identifier 	
	[Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}


 
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	Log To Console    resp_jsonReq:${resp_jsonReq}    

	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${queryString}=    Set Variable    ${resp_jsonReq['queryString']}


	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER_ROUNTNOTFOUND}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${requestObject}=    Replace String To Object    ${replaceUserAgent}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

Check ResponseObject App Get A Whitelist By Thing Identifier	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}


	${custom1}=    Set Variable    ${dataResponse['custom1']}   
	${DataresponseObject}=    Set Variable    ${custom1['responseObject']} 
	Log To Console  DataresponseObject : ${DataresponseObject}
	${responseInfo}=    Evaluate    json.loads(r'''${DataresponseObject}''')    json
 	Log To Console    responseInfo${responseInfo}
	${WhitelistInfo}=    Set Variable    ${responseInfo['WhitelistInfo']} 
	Log To Console  WhitelistInfo : ${WhitelistInfo}
	${CreatedDatetime}=    Set Variable    ${WhitelistInfo['CreatedDatetime']} 
	Log To Console  CreatedDatetime : ${CreatedDatetime}
	${LastUpdatedTimestamp}=    Set Variable    ${WhitelistInfo['LastUpdatedTimestamp']} 
	Log To Console  LastUpdatedTimestamp : ${LastUpdatedTimestamp}

	${WhitelistInfo}=    Set Variable    ${response['WhitelistInfo']} 
	${ThingIdentifier}=    Set Variable    ${WhitelistInfo['ThingIdentifier']}   
	Log To Console    ThingIdentifier:${ThingIdentifier}      
	${OwnerId}=    Set Variable    ${WhitelistInfo['OwnerId']}  
	Log To Console    OwnerId:${OwnerId}   
	${OwnerType}=    Set Variable    ${WhitelistInfo['OwnerType']} 
	Log To Console    OwnerType:${OwnerType} 
	${WhitelistId}=    Set Variable    ${WhitelistInfo['WhitelistId']} 
	Log To Console    WhitelistId:${WhitelistId} 

	${replaceDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER}    [DeveloperMessage]    ${description}  
	${replaceCode}=    Replace String    ${replaceDescription}    [Code]    ${code}
	${replaceCreatedDatetime}=    Replace String    ${replaceCode}    [CreatedDatetime]    ${CreatedDatetime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDatetime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
	${replaceThingIdentifier}=    Replace String    ${replaceLastUpdatedTimestamp}    [ThingIdentifier]    ${ThingIdentifier}[0]
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifier}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${replaceWhitelistId}=    Replace String    ${replaceOwnerType}    [WhitelistId]    ${WhitelistId}
	${responseObject}=    Replace String To Object    ${replaceWhitelistId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}





#======================================================================= Check RequestObject and Response VerifiesThings==========================================================================================================================================================#
Check RequestObject App Success VerifiesThings	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}
	Log To Console    Check RequestObject App Success VerifiesThings    



	${routeParameters}=    Set Variable If    '${pathUrl}'=='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    "routeParameters":{"WorkerId":""},         
	...    '${pathUrl}'!='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    "routeParameters":{"WorkerId":"[WorkerId]"},     

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${WorkerId}=    Set Variable If    '${pathUrl}'!='${URL_VERIFIESTHINGS_MISSINGWORKERID}'     ${resp_jsonReq['routeParameters']['WorkerId']}
	...    '${pathUrl}'=='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    ${EMPTY}  

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_VERIFIESTHINGS}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceRouteParameters}=    Replace String    ${replaceX_Ais_SessionId}    [routeParameters]    ${routeParameters}
	${replaceWorkerId}=    Replace String    ${replaceRouteParameters}    [WorkerId]    ${WorkerId}
	${replaceUserAgent}=    Replace String    ${replaceWorkerId}    [User-Agent]    ${User-Agent}
	${replaceBody}=    Replace String    ${replaceUserAgent}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}



Check ResponseObject Success VerifiesThings
	[Arguments]     ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    Check ResponseObject Success VerifiesThings
	Log To Console    response:${response}    
	Log To Console    Body:${body}    
	${GetLengthRes}=    Get Length    ${response}
	Log To Console    GetLengthRes${GetLengthRes}  

	Run Keyword If    '${GetLengthRes}'=='1'    Check ResponseObject Success VerifiesThings1Data    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}            
	Run Keyword If    '${GetLengthRes}'=='2'    Check ResponseObject Success VerifiesThings2Data    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}            

	      
Check ResponseObject Success VerifiesThings1Data
	[Arguments]     ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    Check ResponseObject Success VerifiesThings1Data
	${bodyInfo}=    Evaluate    json.loads(r'''${body}''')    json
 	Log To Console    bodyInfo${bodyInfo}
	${ThingIdentifier}=    Set Variable     ${bodyInfo[0]["ThingIdentifier"]}
	Log To Console    ThingIdentifier:${ThingIdentifier}
	${ThingSecret}=    Set Variable     ${bodyInfo[0]["ThingSecret"]}
	Log To Console    ThingSecret:${ThingSecret}
	${IMEI}=    Set Variable     ${bodyInfo[0]["IMEI"]}
	Log To Console    IMEI:${IMEI}


	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_VERIFIESTHINGS}    [StatusDescription]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Status]    ${code}
	${replaceIMEI}=    Replace String    ${replaceStatus}    [IMEI]    ${IMEI}
	${replaceThingSecret}=    Replace String    ${replaceIMEI}    [ThingSecret]    ${ThingSecret}
	${replaceThingIdentifier}=    Replace String    ${replaceThingSecret}    [ThingIdentifier]    ${ThingIdentifier}
	${responseObject}=    Replace String To Object    ${replaceThingIdentifier}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


Check ResponseObject Success VerifiesThings2Data
	[Arguments]     ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    Check ResponseObject Success VerifiesThings2Data
	Log To Console    response${response}   
	Log To Console    body${body} 
	${Getresponse}=    Set Variable    ${response}  
	Log To Console    Getresponse${Getresponse}[0]     
	Log To Console    Getresponse${Getresponse}[1]   
	 
	${ThingIdentifier1}=    Set Variable     ${Getresponse[0]["ThingIdentifier"]}
	${ThingSecret1}=    Set Variable     ${Getresponse[0]["ThingSecret"]}
	${IMEI1}=    Set Variable     ${Getresponse[0]["IMEI"]}

	${ThingIdentifier2}=    Set Variable     ${Getresponse[1]["ThingIdentifier"]}
	${ThingSecret2}=    Set Variable     ${Getresponse[1]["ThingSecret"]}
	${IMEI2}=    Set Variable     ${Getresponse[1]["IMEI"]}

	${replaceStatusDescription1}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_VERIFIESTHINGS2DATA}    [StatusDescription]    ${description}  
	${replaceStatus1}=    Replace String    ${replaceStatusDescription1}    [Status]    ${code}
	${replaceIMEI1}=    Replace String    ${replaceStatus1}    [IMEI]    ${IMEI1}
	${replaceThingSecret1}=    Replace String    ${replaceIMEI1}    [ThingSecret]    ${ThingSecret1}
	${replaceThingIdentifier1}=    Replace String    ${replaceThingSecret1}    [ThingIdentifier]    ${ThingIdentifier1}
	${replaceStatusDescription2}    Replace String    ${replaceThingIdentifier1}    [StatusDescription2]    ${description}  
	${replaceStatus2}=    Replace String    ${replaceStatusDescription2}    [Status2]    ${code}
	${replaceIMEI2}=    Replace String    ${replaceStatus2}    [IMEI2]    ${IMEI2}
	${replaceThingSecret2}=    Replace String    ${replaceIMEI2}    [ThingSecret2]    ${ThingSecret2}
	${replaceThingIdentifier2}=    Replace String    ${replaceThingSecret2}    [ThingIdentifier2]    ${ThingIdentifier2}
	${responseObject}=    Replace String To Object    ${replaceThingIdentifier2}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}




#======================================================================= Check RequestObject and Response ActivateThings==========================================================================================================================================================#
Check RequestObject App Success ActivateThings
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}
	Log To Console    :: Check RequestObject App Success ActivateThings   

	# ${routeParamteters}=    Set Variable If    '${pathUrl}'=='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    ${EMPTY}         
	# ...    '${pathUrl}'!='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    "routeParamteters":{"WorkerId":"[WorkerId]"}, 



	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${WorkerId}=    Set Variable If    '${pathUrl}'!='${URL_VERIFIESTHINGS_MISSINGWORKERID}'     ${resp_jsonReq['routeParameters']['WorkerId']}
	...    '${pathUrl}'=='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    ${EMPTY}  

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_ACTIVATETHINGS}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replaceWorkerId}=    Replace String    ${replaceUserAgent}    [WorkerId]    ${WorkerId}
	${replaceBody}=    Replace String    ${replaceWorkerId}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}


Check ResponseObject Success ActivateThings
	[Arguments]     ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    Check ResponseObject Success ActivateThings
	Log To Console    response:${response}    
	Log To Console    Body:${body}    
	${GetLengthRes}=    Get Length    ${response}
	Log To Console    GetLengthRes${GetLengthRes}  

	Run Keyword If    '${GetLengthRes}'=='1'    Check ResponseObject Success ActivateThings1Data    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}            
	Run Keyword If    '${GetLengthRes}'=='2'    Check ResponseObject Success ActivateThings2Data    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}            

	      
Check ResponseObject Success ActivateThings1Data
	[Arguments]     ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    Check ResponseObject Success ActivateThings1Data
	Log To Console    response${response}[0]

	${ThingIdentifier}=    Set Variable     ${response[0]["ThingIdentifier"]}
	Log To Console    ThingIdentifier:${ThingIdentifier}
	${ThingSecret}=    Set Variable     ${response[0]["ThingSecret"]}
	Log To Console    ThingSecret:${ThingSecret}
	${IMEI}=    Set Variable     ${response[0]["IMEI"]}
	Log To Console    IMEI:${IMEI}
	${ThingId}=    Set Variable     ${response[0]["ThingId"]}
	Log To Console    ThingId:${ThingId}
	${ThingName}=    Set Variable     ${response[0]["ThingName"]}
	Log To Console    ThingName:${ThingName}
	${SupplierDetail}=    Set Variable     ${response[0]["SupplierDetail"]}
	Log To Console    SupplierDetail:${SupplierDetail}
	${SupplierId}=    Set Variable     ${SupplierDetail["SupplierId"]}
	Log To Console    SupplierId:${SupplierId}
	${SupplierName}=    Set Variable     ${SupplierDetail["SupplierName"]}
	Log To Console    SupplierName:${SupplierName}

	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_ACTIVATETHINGS}    [StatusDescription]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Status]    ${code}
	${replaceSupplierName}=    Replace String    ${replaceStatus}    [SupplierName]    ${SupplierName}
	${replaceSupplierId}=    Replace String    ${replaceSupplierName}    [SupplierId]    ${SupplierId}
	${replaceThingSecret}=    Replace String    ${replaceSupplierId}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingIdentifier}=    Replace String    ${replaceIMEI}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingName}=    Replace String    ${replaceThingIdentifier}    [ThingName]    ${ThingName}
	${replaceThingId}=    Replace String    ${replaceThingName}    [ThingId]    ${ThingId}
	${responseObject}=    Replace String To Object    ${replaceThingId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


Check ResponseObject Success ActivateThings2Data
	[Arguments]     ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    Check ResponseObject Success ActivateThings2Data
	Log To Console    response${response}   
	Log To Console    body${body} 
	${Getresponse}=    Set Variable    ${response}  
	Log To Console    Getresponse${Getresponse}[0]     
	Log To Console    Getresponse${Getresponse}[1]   
	 
	${ThingIdentifier}=    Set Variable     ${response[0]["ThingIdentifier"]}
	${ThingSecret}=    Set Variable     ${response[0]["ThingSecret"]}
	${IMEI}=    Set Variable     ${response[0]["IMEI"]}
	${ThingId}=    Set Variable     ${response[0]["ThingId"]}
	${ThingName}=    Set Variable     ${response[0]["ThingName"]}
	${SupplierDetail}=    Set Variable     ${response[0]["SupplierDetail"]}
	${SupplierId}=    Set Variable     ${SupplierDetail["SupplierId"]}
	${SupplierName}=    Set Variable     ${SupplierDetail["SupplierName"]}


	${ThingIdentifier2}=    Set Variable     ${response[1]["ThingIdentifier"]}
	${ThingSecret2}=    Set Variable     ${response[1]["ThingSecret"]}
	${IMEI2}=    Set Variable     ${response[1]["IMEI"]}
	${ThingId2}=    Set Variable If     ${response[1]["ThingId"]}
	${ThingName2}=    Set Variable If     ${response[1]["ThingName"]}
	${SupplierDetail}=    Set Variable     ${response[1]["SupplierDetail"]}
	${SupplierId2}=    Set Variable     ${SupplierDetail["SupplierId"]}
	${SupplierName2}=    Set Variable     ${SupplierDetail["SupplierName"]}


	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_ACTIVATETHINGS2DATA}    [StatusDescription]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Status]    ${code}
	${replaceSupplierName}=    Replace String    ${replaceStatus}    [SupplierName]    ${SupplierName}
	${replaceSupplierId}=    Replace String    ${replaceSupplierName}    [SupplierId]    ${SupplierId}
	${replaceThingSecret}=    Replace String    ${replaceSupplierId}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingIdentifier}=    Replace String    ${replaceIMEI}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingName}=    Replace String    ${replaceThingIdentifier}    [ThingName]    ${ThingName}
	${replaceThingId}=    Replace String    ${replaceThingName}    [ThingId]    ${ThingId}
	${replaceStatusDescription2}    Replace String    ${replaceThingId}    [StatusDescription2]    ${description} 
	${replaceStatus2}=    Replace String    ${replaceStatusDescription2}    [Status2]    ${code}
	${replaceSupplierName2}=    Replace String    ${replaceStatus2}    [SupplierName2]    ${SupplierName2}
	${replaceSupplierId2}=    Replace String    ${replaceSupplierName2}    [SupplierId2]    ${SupplierId2}
	${replaceThingSecret2}=    Replace String    ${replaceSupplierId2}    [ThingSecret2]    ${ThingSecret2}
	${replaceIMEI2}=    Replace String    ${replaceThingSecret2}    [IMEI2]    ${IMEI2}
	${replaceThingIdentifier2}=    Replace String    ${replaceIMEI2}    [ThingIdentifier2]    ${ThingIdentifier2}
	${replaceThingName2}=    Replace String    ${replaceThingIdentifier2}    [ThingName2]    ${ThingName2}
	${replaceThingId2}=    Replace String    ${replaceThingName2}    [ThingId2]    ${ThingId2}
	${responseObject}=    Replace String To Object    ${replaceThingId2}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}




#======================================================================= Check RequestObject and Response TerminatesThings==========================================================================================================================================================#
Check RequestObject App Success TerminatesThings
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}
	Log To Console    :: Check RequestObject App Success TerminatesThings   

	${routeParameters}=    Set Variable If    '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${EMPTY}         
	...    '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    "routeParameters":{"WorkerId":"[WorkerId]"},   

    
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}   
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${WorkerId}=    Set Variable If    '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'     ${resp_jsonReq['routeParameters']['WorkerId']}
	...    '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${EMPTY}
 

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_TERMINATESTHINGS}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}  
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceX_User-Agent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replaceRouteParameters}=    Replace String    ${replaceX_User-Agent}    [routeParameters]    ${routeParameters}
	${replaceWorkerId}=    Replace String    ${replaceRouteParameters}    [WorkerId]    ${WorkerId}
	${replaceBody}=    Replace String    ${replaceWorkerId}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}


#======================================================================= Check RequestObject and Response ReturnsAListofThings==========================================================================================================================================================#
Check RequestObject App Success ReturnsAListofThings
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}    ${cmdName}
	Log To Console    :: Check RequestObject App Success ReturnsAListofThings   
	Log To Console    :: Check body${body}
	Log To Console    :: Check pathUrl${pathUrl}
  

	#make because value ${body} have ' so not condition
    ${bodyCheckGetAll}=    Set Variable    ${body}
    ${removeTextBodyCheckGetAll}=    Remove String    ${bodyCheckGetAll}    '    ${EMPTY}
	Log To Console    :: Check removeTextBodyCheckGetAll${removeTextBodyCheckGetAll}


	${queryString}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}' and '${removeTextBodyCheckGetAll}'=='null'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}' and '${removeTextBodyCheckGetAll}'!='null'    ${body}   
	Log To Console    :: Check queryString${queryString}   


	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}   
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
    ${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${WorkerId}=    Set Variable    ${resp_jsonReq['routeParameters']['WorkerId']}
 

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_RETURNSALISTOFTHINGS}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [User-Agent]    ${User-Agent}
	${replacequeryString}=    Replace String    ${replaceUserAgent}    [queryString]    ${queryString}
	${replaceWorkerId}=    Replace String    ${replacequeryString}    [WorkerId]    ${WorkerId}
	${requestObject}=    Replace String To Object    ${replaceWorkerId}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

Check ResponseObject Success ReturnsAListofThings
	[Arguments]     ${code}    ${description}    ${dataResponse}    ${response}
	Log To Console    Check ResponseObject Success ReturnsAListofThings

	${ThingInfo}=    Set Variable     ${response["ThingInfo"]}
	${ThingId}=    Set Variable     ${ThingInfo[0]["ThingId"]}
	${WorkerId}=    Set Variable     ${ThingInfo[0]["WorkerId"]}
	${ConnectivityType}=    Set Variable     ${ThingInfo[0]["ConnectivityType"]}
	${ThingName}=    Set Variable     ${ThingInfo[0]["ThingName"]}
	${ThingIdentifier}=    Set Variable     ${ThingInfo[0]["ThingIdentifier"]}
	${ThingSecret}=    Set Variable     ${ThingInfo[0]["ThingSecret"]}
	${IMEI}=    Set Variable     ${ThingInfo[0]["IMEI"]}
	${ThingState}=    Set Variable     ${ThingInfo[0]["ThingState"]}
	${SupplierDetail}=    Set Variable     ${ThingInfo[0]["SupplierDetail"]}
	${SupplierId}=    Set Variable     ${SupplierDetail["SupplierId"]}
	${SupplierName}=    Set Variable     ${SupplierDetail["SupplierName"]}


	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	Log To Console    resp_jsonLog${resp_jsonLog}
	${reponseThingInfo}=    Set Variable    ${resp_jsonLog['ThingInfo']}
    Log To Console    reponseThingInfo${reponseThingInfo}

	${MetaData}=    Set Variable    ${resp_jsonLog['@Metadata']}  
	Log To Console    MetaData${MetaData}  

	${CurrentPage}=    Set Variable    ${MetaData['CurrentPage']} 
	${TotalPages}=    Set Variable    ${MetaData['TotalPages']} 
	${Top}=    Set Variable    ${MetaData['Top']} 
	${TotalCount}=    Set Variable    ${MetaData['TotalCount']} 
	${HasPrevious}=    Set Variable If    '${MetaData['HasPrevious']}'=='False'    false    
	${HasNext}=    Set Variable If    '${MetaData['HasNext']}'=='False'    false
	...    '${MetaData['HasNext']}'!='False'    true     

	${CurrentPage_Str}=    Convert To String    ${CurrentPage}
	${TotalPages_Str}=    Convert To String    ${TotalPages}
	${Top_Str}=    Convert To String    ${Top}
	${TotalCount_Str}=    Convert To String    ${TotalCount}
	${HasPrevious_Str}=    Convert To String    ${HasPrevious}
	${HasNext_Str}=    Convert To String    ${HasNext}

	${CreatedDateTime}=    Set Variable     ${reponseThingInfo[0]['CreatedDatetime']}
	${LastUpdatedTimestamp}=    Set Variable     ${reponseThingInfo[0]['LastUpdatedTimestamp']}

	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_RETURNSALISTOFTHINGS}    [DeveloperMessage]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Code]    ${code}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceStatus}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
	${replaceCurrentPage}=    Replace String    ${replaceLastUpdatedTimestamp}    [CurrentPage]    ${CurrentPage_Str}
	${replaceTotalPages}=    Replace String    ${replaceCurrentPage}    [TotalPages]    ${TotalPages_Str}
	${replaceTop}=    Replace String    ${replaceTotalPages}    [Top]    ${Top_Str}
	${replaceTotalCount}=    Replace String    ${replaceTop}    [TotalCount]    ${TotalCount_Str}
	${replaceHasPrevious}=    Replace String    ${replaceTotalCount}    [HasPrevious]    ${HasPrevious_Str}
	${replaceHasNext}=    Replace String    ${replaceHasPrevious}    [HasNext]    ${HasNext_Str}
	${replaceCreatedDatetime}=    Replace String    ${replaceHasNext}    [CreatedDatetime]    ${CreatedDatetime}
	${replaceSupplierName}=    Replace String    ${replaceCreatedDatetime}    [SupplierName]    ${SupplierName}
	${replaceSupplierId}=    Replace String    ${replaceSupplierName}    [SupplierId]    ${SupplierId}
	${replaceThingState}=    Replace String    ${replaceSupplierId}    [ThingState]    ${ThingState}
	${replaceIMEI}=    Replace String    ${replaceThingState}    [IMEI]    ${IMEI}
	${replaceThingSecret}=    Replace String    ${replaceIMEI}    [ThingSecret]    ${ThingSecret}
	${replaceThingIdentifier}=    Replace String    ${replaceThingSecret}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingName}=    Replace String    ${replaceThingIdentifier}    [ThingName]    ${ThingName}
	${replaceConnectivityType}=    Replace String    ${replaceThingName}    [ConnectivityType]    ${ConnectivityType}
	${replaceWorkerId}=    Replace String    ${replaceConnectivityType}    [WorkerId]    ${WorkerId}
	${replaceThingId}=    Replace String    ${replaceWorkerId}    [ThingId]    ${ThingId}
	${responseObject}=    Replace String To Object    ${replaceThingId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


#======================================================================= Check RequestObject and Response ImportThing ==========================================================================================================================================================#
Check RequestObject App Success ImportThing
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}
	Log To Console    :: Check RequestObject App Success ImportThing   

	# ${routeParamteters}=    Set Variable If    '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${EMPTY}         
	# ...    '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    "routeParamteters":{"WorkerId":"[WorkerId]"},   

    
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}   
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	# ${WorkerId}=    Set Variable If    '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'     ${resp_jsonReq['routeParamteters']['WorkerId']}
	# ...    '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${EMPTY}
 

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_IMPORTTHING}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUser-Agent}=    Replace String    ${replaceX_Ais_SessionId}    [user-agent]    ${User-Agent}
	${replaceBody}=    Replace String    ${replaceUser-Agent}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}


#======================================================================= Check RequestObject and Response ImportThingBySupplierID ==========================================================================================================================================================#
Check RequestObject App Success ImportThingBySupplierID
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}
	Log To Console    :: Check RequestObject App Success ImportThing   

    ${SupURL}=    Remove String    ${pathUrl}    ${URL_IMPORTTHINGBYSUPPLIER}
    ${SupplierId}=    Remove String    ${SupURL}    /Things/Import
	
	${routeParamteters}=    Set Variable    {"SupplierId":"${SupplierId}"}   

    
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}   
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${User-Agent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	${x-ais-orderref}=    Set Variable    ${resp_jsonReq['headers']['x-ais-orderref']}
	${x-ais-orderdesc}=    Set Variable    ${resp_jsonReq['headers']['x-ais-orderdesc']}

 

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_IMPORTTHINGBYSUPPLIER}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUser-Agent}=    Replace String    ${replaceX_Ais_SessionId}    [user-agent]    ${User-Agent}
	${replacex-ais-orderref}=    Replace String    ${replaceUser-Agent}    [x-ais-orderref]    ${x-ais-orderref}
	${replacex-ais-orderdesc}=    Replace String    ${replacex-ais-orderref}    [x-ais-orderdesc]    ${x-ais-orderdesc}
	${replacerouteParamteters}=    Replace String    ${replacex-ais-orderdesc}    [routeParameters]    ${routeParamteters}
	${replaceBody}=    Replace String    ${replacerouteParamteters}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}
    Log    requestObject=${requestObject}
    Log    dataResponse=${dataResponse}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}






#-------------------------------------------- Worker --------------------------------------------#	
#-------------------------------------------- Worker : RequestObject --------------------------------------------#	
Check RequestObject App Success Worker	
    [Arguments]    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}

	# '{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]",
	# "host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]",
	# "x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]",
	# "x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},
	# "queryString":[queryString],"routeParameters":[routeParameters],"body":[body]}'
    
	#make because value ${body} have ' so not condition
    ${bodyCheckGetAll}=    Set Variable    ${body}
    ${removeTextBodyCheckGetAll}=    Remove String    ${bodyCheckGetAll}    '    ${EMPTY}

	${method}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}'    ${NAME_SESSION_POST}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}'    ${NAME_SESSION_PUT}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'    ${NAME_SESSION_PATCH}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}' and '${removeTextBodyCheckGetAll}'!='null'    ${NAME_SESSION_PATCH}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}' and '${removeTextBodyCheckGetAll}'=='null'    ${NAME_SESSION_DELETE}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}'    ${NAME_SESSION_DELETE}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}'    ${NAME_SESSION_GET}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}'    ${NAME_SESSION_GET}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}'    ${NAME_SESSION_POST}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}'    ${NAME_SESSION_POST}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}'    ${NAME_SESSION_POST}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}'    ${NAME_SESSION_PUT}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}'    ${NAME_SESSION_DELETE}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${accountId}'=='${ASSIGNTHINGSTOWORKERS}'    ${NAME_SESSION_POST}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${accountId}'=='${UPDATETHINGSTOWORKERS}'    ${NAME_SESSION_PUT}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${accountId}'=='${DELETETHINGSFROMWORKER}'    ${NAME_SESSION_DELETE}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${accountId}'!='${ASSIGNTHINGSTOWORKERS}' and '${accountId}'!='${UPDATETHINGSTOWORKERS}' and '${accountId}'!='${DELETETHINGSFROMWORKER}'    ${NAME_SESSION_POST}
	
    #Log To Console    method${method}

	${orderdesc}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}'    ${HEADER_X_AIS_ORDERDESC_CREATEAWORKER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}'    ${HEADER_X_AIS_ORDERDESC_UPDATEAWORKER}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'    ${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEAWORKER}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}' and '${removeTextBodyCheckGetAll}'!='null'    ${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEAWORKER}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}' and '${removeTextBodyCheckGetAll}'=='null'    ${HEADER_X_AIS_ORDERDESC_DELETEAWORKER}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}'    ${HEADER_X_AIS_ORDERDESC_DELETEAWORKER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}'    ${HEADER_X_AIS_ORDERDESC_GETAWORKERBYWORKERID}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}'    ${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFWORKER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}'    ${HEADER_X_AIS_ORDERDESC_IMPORTSLISTOFTHINGBYWORKERID}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}'    ${HEADER_X_AIS_ORDERDESC_EXPORTSLISTOFTHINGBYWORKERID}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}'    ${HEADER_X_AIS_ORDERDESC_ASSIGNTHINGSTOWORKERS}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}'    ${HEADER_X_AIS_ORDERDESC_UPDATETHINGSTOWORKERS}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}'    ${HEADER_X_AIS_ORDERDESC_DELETETHINGSFROMWORKER}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_IMPORTSLISTOFTHINGBYWORKERID_NOWORKERID}'   ${HEADER_X_AIS_ORDERDESC_IMPORTSLISTOFTHINGBYWORKERID}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_EXPORTSLISTOFTHINGBYWORKERID_NOWORKERID}'   ${HEADER_X_AIS_ORDERDESC_EXPORTSLISTOFTHINGBYWORKERID}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${accountId}'=='${ASSIGNTHINGSTOWORKERS}'   ${HEADER_X_AIS_ORDERDESC_ASSIGNTHINGSTOWORKERS}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${accountId}'=='${UPDATETHINGSTOWORKERS}'   ${HEADER_X_AIS_ORDERDESC_UPDATETHINGSTOWORKERS}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${accountId}'=='${DELETETHINGSFROMWORKER}'   ${HEADER_X_AIS_ORDERDESC_DELETETHINGSFROMWORKER}
    
	# Log To Console    orderdesc${orderdesc}

    ${WorkerId}=    Remove String    ${pathUrl}    ${URL_UPDATEAWORKER}
	${WorkerId}=    Remove String    ${WorkerId}    /Import/Things
	${WorkerId}=    Remove String    ${WorkerId}    /Export/Things
	${WorkerId}=    Remove String    ${WorkerId}    /Thing/Assign

	${requestObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
    # Log To Console    requestObjectData${requestObjectData}
 
	${resp_json}=    Evaluate    json.loads(r'''${requestObjectData}''')    json
	# Log To Console    resp_json${resp_json}

	${routeParameters}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}'    {}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}'    {"WorkerId":"${WorkerId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'    {"WorkerId":"${WorkerId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}'    {}  
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}'    {"WorkerId":"${WorkerId}"}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}'    {"WorkerId":"${WorkerId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}'    {"WorkerId":"${WorkerId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}'    {"WorkerId":"${WorkerId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}'    {"WorkerId":"${WorkerId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}'    {"WorkerId":"${WorkerId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}'    {"WorkerId":"${WorkerId}"}
    # Log To Console    routeParameters${routeParameters}
	

    ${queryString}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}' and '${removeTextBodyCheckGetAll}'=='null'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}' and '${removeTextBodyCheckGetAll}'!='null'    ${body}

    # Log To Console    queryString${queryString}

	${contentType}=    Set Variable    ${resp_json['headers']['Content-Type']}
	${acceptEncoding}=    Set Variable    ${resp_json['headers']['Accept-Encoding']}
	${host}=    Set Variable    ${resp_json['headers']['Host']}
	${userAgent}=    Set Variable    ${resp_json['headers']['User-Agent']}
	${contentLength}=    Set Variable    ${resp_json['headers']['Content-Length']}
	${xRealIp}=    Set Variable    ${resp_json['headers']['x-real-ip']}
	${xForwardedFor}=    Set Variable    ${resp_json['headers']['x-forwarded-for']}
	${xForwardedProto}=    Set Variable    ${resp_json['headers']['x-forwarded-proto']}
	${xRequestId}=    Set Variable    ${resp_json['headers']['x-request-id']}
	${xB3Traceid}=    Set Variable    ${resp_json['headers']['x-b3-traceid']}
	${xB3Spanid}=    Set Variable    ${resp_json['headers']['x-b3-spanid']}
	${xAisSessionId}=    Set Variable    ${resp_json['headers']['x-ais-SessionId']}
	${xB3Sampled}=    Set Variable    ${resp_json['headers']['x-b3-sampled']}

    ${valueReplace}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOBODY}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOBODY} 
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}' and '${code}'!='${VALUE_LOG_CODE_40500}'     ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOBODY}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}' and '${code}'=='${VALUE_LOG_CODE_40500}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOBODYROUTEPARAMETERS}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER} 
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOROUTEPARAMETERS} 
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER} 
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER} 
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER} 
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER} 
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}' and '${removeTextBodyCheckGetAll}'!='null'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOROUTEPARAMETERS}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}' and '${removeTextBodyCheckGetAll}'=='null'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOBODYROUTEPARAMETERS}
	
	${replaceUrl}=    Replace String    ${valueReplace}    [valuePathUrl]    ${pathUrl}
	${replaceTid}=    Replace String    ${replaceUrl}    [tid]    ${tid}
	${replaceBody}=    Replace String    ${replaceTid}    [body]    ${body}
	${replaceMethod}=    Replace String    ${replaceBody}    [method]    ${method}
	${replaceOrderdesc}=    Replace String    ${replaceMethod}    [Orderdesc]    ${orderdesc}
	${replaceHost}=    Replace String    ${replaceOrderdesc}    [host]    ${host}
	${replaceXrealIp}=    Replace String    ${replaceHost}    [x-real-ip]    ${xRealIp}
	${replaceXforwardedFor}=    Replace String    ${replaceXrealIp}    [x-forwarded-for]    ${xForwardedFor}
	${replaceXforwardedProto}=    Replace String    ${replaceXforwardedFor}    [x-forwarded-proto]    ${xForwardedProto}
	${replaceContentLength}=    Replace String    ${replaceXforwardedProto}    [content-length]    ${contentLength}
	${replaceUserAgent}=    Replace String    ${replaceContentLength}    [user-agent]    ${userAgent}
	${replaceAcceptEncoding}=    Replace String    ${replaceUserAgent}    [accept-encoding]    ${acceptEncoding}
	${replaceContentType}=    Replace String    ${replaceAcceptEncoding}    [content-type]    ${contentType}
	${replaceXrequestId}=    Replace String    ${replaceContentType}    [x-request-id]    ${xRequestId}
	${replaceXb3Traceid}=    Replace String    ${replaceXrequestId}    [x-b3-traceid]    ${xB3Traceid}
	${replaceXb3Spanid}=    Replace String    ${replaceXb3Traceid}    [x-b3-spanid]    ${xB3Spanid}
	${replaceXb3Sampled}=    Replace String    ${replaceXb3Spanid}    [x-b3-sampled]    ${xB3Sampled}
	${replaceXAisSessionId}=    Replace String    ${replaceXb3Sampled}    [x-ais-SessionId]    ${xAisSessionId}
	${replaceRouteParameters}=    Replace String    ${replaceXAisSessionId}    [routeParameters]    ${routeParameters}
	${replaceQueryString}=    Replace String    ${replaceRouteParameters}    [queryString]    ${queryString}
	# ${replaceText}=    Replace String    ${replaceQueryString}    '    ${EMPTY}
	${requestObject}=    Replace String To Object    ${replaceQueryString}
	# Log To Console    WorkerRequestObjectApp${requestObject}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

#-------------------------------------------- Worker : ResponseObject --------------------------------------------#	
Check ResponseObject App Success Worker	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	#"{"WorkersInfo":{"WorkerId":"[WorkerId]","WorkerName":"[WorkerName]","ServerProperties":{"ServerIP":"[ServerIP]","ServerPort":"[ServerPort]",
	# "ServerDomain":"[ServerDomain]"},"WorkerState":"[WorkerState]","CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},
	# "OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"

	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    # Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	# Log To Console    resp_jsonLog${resp_jsonLog}
	${reponseWorkersInfo}=    Set Variable    ${resp_jsonLog['WorkersInfo']}
    # Log To Console    reponseWorkersInfo${reponseWorkersInfo}

	${CreatedDateTime}=    Set Variable     ${reponseWorkersInfo['CreatedDatetime']}
	${LastUpdatedTimestamp}=    Set Variable     ${reponseWorkersInfo['LastUpdatedTimestamp']}

    ${body}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'     ${body}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'     ${response}
	# Log To Console    body${body}

    ${resp_json}=    Evaluate    json.loads(r'''${body}''')    json
	# Log To Console    resp_json${resp_json}

	${WorkersInfo}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'    ${response['WorkersInfo']}
	${WorkerId}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'     ${WorkersInfo['WorkerId']}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'     ${resp_json['WorkerId']}
	
	${WorkerName}=    Set Variable     ${resp_json['WorkerName']}
	${WorkerState}=    Set Variable     ${resp_json['WorkerState']}
	${ServerProperties}=    Set Variable     ${resp_json['ServerProperties']}
	${ServerIP}=    Set Variable     ${ServerProperties['ServerIP']}
	${ServerPort}=    Set Variable     ${ServerProperties['ServerPort']}
	${ServerDomain}=    Set Variable     ${ServerProperties['ServerDomain']}

	${replaceCode}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_WORKER}    [Code]    ${code}  
	${replaceDescription}=    Replace String    ${replaceCode}    [DeveloperMessage]    ${description}
	${replaceWorkerId}=    Replace String    ${replaceDescription}    [WorkerId]    ${WorkerId}
	${replaceWorkerName}=    Replace String    ${replaceWorkerId}    [WorkerName]    ${WorkerName}
	${replaceWorkerState}=    Replace String    ${replaceWorkerName}    [WorkerState]    ${WorkerState}
	${replaceServerIP}=    Replace String    ${replaceWorkerState}    [ServerIP]    ${ServerIP}
	${replaceServerPort}=    Replace String    ${replaceServerIP}    [ServerPort]    ${ServerPort}
	${replaceServerDomain}=    Replace String    ${replaceServerPort}    [ServerDomain]    ${ServerDomain}
	${replaceCreatedDateTime}=    Replace String    ${replaceServerDomain}    [CreatedDatetime]    ${CreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
    ${responseObject}=    Replace String To Object    ${replaceLastUpdatedTimestamp}
	# Log To Console    WorkerrresponseObject${responseObject}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

#-------------------------------------------- Worker [ExportsListOfThingsByWorkerId] : ResponseObject --------------------------------------------#	
Check ResponseObject App Success ExportsListOfThingsByWorkerId
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	
	# 'responseObject': '{"ThingInfo":[{"ThingId":"61372947dc3a5200016fc8b6","WorkerId":"61372946dc3a5200016fc8b4","ConnectivityType":"NBIOT","ThingName":"ThingName51854556","ThingIdentifier":"8966035092700427709","ThingSecret":"10792095810481292802","IMEI":"99681283779348739077","ThingState":"Idle","CustomDetails":{},"SupplierDetail":{"SupplierId":"SupplierId51854556","SupplierName":"SupplierName51854556"},"CreatedDatetime":"2021-09-07T08:56:39.081Z","LastUpdatedTimestamp":"2021-09-07T08:56:39.081Z"}],"@Metadata":{"CurrentPage":1,"TotalPages":1,"Top":10,"TotalCount":1,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}'
	
	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    # Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	# Log To Console    resp_jsonLog${resp_jsonLog}

	${reponseThingInfo}=    Set Variable    ${resp_jsonLog['ThingInfo'][0]}
    # Log To Console    reponseThingInfo${reponseThingInfo}

	${CreatedDateTime}=    Set Variable     ${reponseThingInfo['CreatedDatetime']}
	${LastUpdatedTimestamp}=    Set Variable     ${reponseThingInfo['LastUpdatedTimestamp']}

    ${resp_json}=    Evaluate    json.loads(r'''${response}''')    json
	${ThingInfo}=    Set Variable    ${resp_json['ThingInfo'][0]}
	# Log To Console    ThingInfo${ThingInfo}
	${ThingId}=    Set Variable     ${ThingInfo['ThingId']}
	${WorkerId}=    Set Variable     ${ThingInfo['WorkerId']}
	${ConnectivityType}=    Set Variable     ${ThingInfo['ConnectivityType']}
	${ThingName}=    Set Variable     ${ThingInfo['ThingName']}
	${ThingIdentifier}=    Set Variable     ${ThingInfo['ThingIdentifier']}
	${ThingSecret}=    Set Variable     ${ThingInfo['ThingSecret']}
	${IMEI}=    Set Variable     ${ThingInfo['IMEI']}
	${ThingState}=    Set Variable     ${ThingInfo['ThingState']}
	${CustomDetails}=    Set Variable     ${ThingInfo['CustomDetails']}
	${SupplierDetail}=    Set Variable     ${ThingInfo['SupplierDetail']}
	${SupplierId}=    Set Variable     ${SupplierDetail['SupplierId']}
	${SupplierName}=    Set Variable     ${SupplierDetail['SupplierName']}

	${replaceCode}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_WORKER_EXPORTSLISTOFTHINGBYWORKERID}    [Code]    ${code}  
	${replaceDescription}=    Replace String    ${replaceCode}    [DeveloperMessage]    ${description}
	${replaceThingId}=    Replace String    ${replaceDescription}    [ThingId]    ${ThingId}
	${replaceWorkerId}=    Replace String    ${replaceThingId}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${replaceCreatedDateTime}=    Replace String    ${replaceSupplierName}    [CreatedDatetime]    ${CreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
    ${responseObject}=    Replace String To Object    ${replaceLastUpdatedTimestamp}
	# Log To Console    ExportsListOfThingsByWorkerIdresponseObject${responseObject}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

#-------------------------------------------- Worker [UpdateThingsToWorkers] : ResponseObject --------------------------------------------#	
Check ResponseObject App Success UpdateThingsToWorkers
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	
	# 'responseObject': '{"ThingInfo":[{"ThingId":"61372947dc3a5200016fc8b6","WorkerId":"61372946dc3a5200016fc8b4","ConnectivityType":"NBIOT","ThingName":"ThingName51854556","ThingIdentifier":"8966035092700427709","ThingSecret":"10792095810481292802","IMEI":"99681283779348739077","ThingState":"Idle","CustomDetails":{},"SupplierDetail":{"SupplierId":"SupplierId51854556","SupplierName":"SupplierName51854556"},"CreatedDatetime":"2021-09-07T08:56:39.081Z","LastUpdatedTimestamp":"2021-09-07T08:56:39.081Z"}],"@Metadata":{"CurrentPage":1,"TotalPages":1,"Top":10,"TotalCount":1,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}'
	
	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    # Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	# Log To Console    resp_jsonLog${resp_jsonLog}

	${reponseThingInfo}=    Set Variable    ${resp_jsonLog['ThingInfo']}
    # Log To Console    reponseThingInfo${reponseThingInfo}

	${CreatedDateTime}=    Set Variable     ${reponseThingInfo['CreatedDatetime']}
	${LastUpdatedTimestamp}=    Set Variable     ${reponseThingInfo['LastUpdatedTimestamp']}

    ${resp_json}=    Evaluate    json.loads(r'''${response}''')    json
	# Log To Console    resp_json${resp_json}
	${ThingInfo}=    Set Variable    ${resp_json['ThingInfo']}
	# Log To Console    ThingInfo${ThingInfo}
	${ThingId}=    Set Variable     ${ThingInfo['ThingId']}
	${WorkerId}=    Set Variable     ${ThingInfo['WorkerId']}
	${ConnectivityType}=    Set Variable     ${ThingInfo['ConnectivityType']}
	${ThingName}=    Set Variable     ${ThingInfo['ThingName']}
	${ThingIdentifier}=    Set Variable     ${ThingInfo['ThingIdentifier']}
	${ThingSecret}=    Set Variable     ${ThingInfo['ThingSecret']}
	${IMEI}=    Set Variable     ${ThingInfo['IMEI']}
	${ThingState}=    Set Variable     ${ThingInfo['ThingState']}
	${CustomDetails}=    Set Variable     ${ThingInfo['CustomDetails']}
	${SupplierDetail}=    Set Variable     ${ThingInfo['SupplierDetail']}
	${SupplierId}=    Set Variable     ${SupplierDetail['SupplierId']}
	${SupplierName}=    Set Variable     ${SupplierDetail['SupplierName']}

	${replaceCode}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_WORKER_UPDATETHINGSTOWORKERS}    [Code]    ${code}  
	${replaceDescription}=    Replace String    ${replaceCode}    [DeveloperMessage]    ${description}
	${replaceThingId}=    Replace String    ${replaceDescription}    [ThingId]    ${ThingId}
	${replaceWorkerId}=    Replace String    ${replaceThingId}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingName}=    Replace String    ${replaceConnectivityType}    [ThingName]    ${ThingName}
	${replaceThingIdentifier}=    Replace String    ${replaceThingName}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceThingState}=    Replace String    ${replaceIMEI}    [ThingState]    ${ThingState}
	${replaceSupplierId}=    Replace String    ${replaceThingState}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${replaceCreatedDateTime}=    Replace String    ${replaceSupplierName}    [CreatedDatetime]    ${CreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
    ${responseObject}=    Replace String To Object    ${replaceLastUpdatedTimestamp}
	# Log To Console    UpdateThingsToWorkersresponseObject${responseObject}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}
	
#-------------------------------------------- Thing --------------------------------------------#	
#-------------------------------------------- Thing : RequestObject --------------------------------------------#	
Check RequestObject App Success Thing	
    [Arguments]    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	Log    ThingpathUrl${pathUrl}
	Log To Console    ${\n}==RequestObject==

    Log    ${cmdName}
	${method}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}'    ${NAME_SESSION_POST}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}'    ${NAME_SESSION_PUT}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}'    ${NAME_SESSION_PATCH}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}'    ${NAME_SESSION_GET}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}'    ${NAME_SESSION_GET}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}'    ${NAME_SESSION_DELETE}
    Log    method${method}

	${orderdesc}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}'    ${HEADER_X_AIS_ORDERDESC_CREATEATHING}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}'    ${HEADER_X_AIS_ORDERDESC_UPDATEATHING}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}'    ${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEATHING}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}'    ${HEADER_X_AIS_ORDERDESC_THINGRETURNSALISTOFTHING}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}'    ${HEADER_X_AIS_ORDERDESC_GETTHINGBYTHINGID}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}'    ${HEADER_X_AIS_ORDERDESC_REMOVEATHING}
	Log    orderdesc${orderdesc}

    ${ThingId}=    Remove String    ${pathUrl}    ${URL_UPDATEATHING}
    ${ThingId}=    Remove String    ${pathUrl}    ${URL_GETTHINGBYTHINGID}
    ${ThingId}=    Remove String    ${pathUrl}    ${URL_REMOVEATHING}

	${requestObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
    Log    requestObjectData${requestObjectData}
 
	${resp_json}=    Evaluate    json.loads(r'''${requestObjectData}''')    json
	Log    resp_json${resp_json}

	${routeParameters}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}'    {}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}'    {"ThingId":"${ThingId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}'    {"ThingId":"${ThingId}"}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}'    {"ThingId":"${ThingId}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}'    {"ThingId":"${ThingId}"}
    Log    routeParameters${routeParameters}

    #make because value ${body} have ' so not condition
    ${bodyCheckGetAll}=    Set Variable    ${body}
    ${removeTextBodyCheckGetAll}=    Remove String    ${bodyCheckGetAll}    '    ${EMPTY}
	Log    ${removeTextBodyCheckGetAll}   
	Log    ${cmdName}
	Log    ${body}
    ${queryString}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}'    {}

	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}' and '${removeTextBodyCheckGetAll}'=='null'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}' and '${removeTextBodyCheckGetAll}'=='null'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}' and '${removeTextBodyCheckGetAll}'=='null'    {}


	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}' and '${removeTextBodyCheckGetAll}'!='null'    ${body}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}' and '${removeTextBodyCheckGetAll}'!='null'    ${body}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}' and '${removeTextBodyCheckGetAll}'!='null'    ${body}


	${contentType}=    Set Variable    ${resp_json['headers']['Content-Type']}
	${acceptEncoding}=    Set Variable    ${resp_json['headers']['Accept-Encoding']}
	${host}=    Set Variable    ${resp_json['headers']['Host']}
	${userAgent}=    Set Variable    ${resp_json['headers']['User-Agent']}
	${contentLength}=    Set Variable    ${resp_json['headers']['Content-Length']}
	${xRealIp}=    Set Variable    ${resp_json['headers']['x-real-ip']}
	${xForwardedFor}=    Set Variable    ${resp_json['headers']['x-forwarded-for']}
	${xForwardedProto}=    Set Variable    ${resp_json['headers']['x-forwarded-proto']}
	${xRequestId}=    Set Variable    ${resp_json['headers']['x-request-id']}
	${xB3Traceid}=    Set Variable    ${resp_json['headers']['x-b3-traceid']}
	${xB3Spanid}=    Set Variable    ${resp_json['headers']['x-b3-spanid']}
	${xAisSessionId}=    Set Variable    ${resp_json['headers']['x-ais-SessionId']}
	${xB3Sampled}=    Set Variable    ${resp_json['headers']['x-b3-sampled']}
    
    ${valueReplace}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}' and '${code}'!='${VALUE_LOG_CODE_40500}'     ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}' and '${code}'=='${VALUE_LOG_CODE_40500}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING_METHINDNOTALLOWED}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING_NOBODY}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING_NOBODY}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING_NOBODY} 
	Log    ${cmdName}
	Log    ${valueReplace}
	

	${replaceUrl}=    Replace String    ${valueReplace}    [valuePathUrl]    ${pathUrl}
	${replaceTid}=    Replace String    ${replaceUrl}    [tid]    ${tid}
	${replaceBody}=    Replace String    ${replaceTid}    [body]    ${body}
	${replaceMethod}=    Replace String    ${replaceBody}    [method]    ${method}
	${replaceOrderdesc}=    Replace String    ${replaceMethod}    [Orderdesc]    ${orderdesc}
	${replaceHost}=    Replace String    ${replaceOrderdesc}    [host]    ${host}
	${replaceXrealIp}=    Replace String    ${replaceHost}    [x-real-ip]    ${xRealIp}
	${replaceXforwardedFor}=    Replace String    ${replaceXrealIp}    [x-forwarded-for]    ${xForwardedFor}
	${replaceXforwardedProto}=    Replace String    ${replaceXforwardedFor}    [x-forwarded-proto]    ${xForwardedProto}
	${replaceContentLength}=    Replace String    ${replaceXforwardedProto}    [content-length]    ${contentLength}
	${replaceUserAgent}=    Replace String    ${replaceContentLength}    [user-agent]    ${userAgent}
	${replaceAcceptEncoding}=    Replace String    ${replaceUserAgent}    [accept-encoding]    ${acceptEncoding}
	${replaceContentType}=    Replace String    ${replaceAcceptEncoding}    [content-type]    ${contentType}
	${replaceXrequestId}=    Replace String    ${replaceContentType}    [x-request-id]    ${xRequestId}
	${replaceXb3Traceid}=    Replace String    ${replaceXrequestId}    [x-b3-traceid]    ${xB3Traceid}
	${replaceXb3Spanid}=    Replace String    ${replaceXb3Traceid}    [x-b3-spanid]    ${xB3Spanid}
	${replaceXb3Sampled}=    Replace String    ${replaceXb3Spanid}    [x-b3-sampled]    ${xB3Sampled}
	${replaceXAisSessionId}=    Replace String    ${replaceXb3Sampled}    [x-ais-SessionId]    ${xAisSessionId}
	${replaceRouteParameters}=    Replace String    ${replaceXAisSessionId}    [routeParameters]    ${routeParameters}
	${replaceQueryString}=    Replace String    ${replaceRouteParameters}    [queryString]    ${queryString}
	${requestObject}=    Replace String To Object    ${replaceQueryString}
	Log    requestObject${requestObject}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}



#-------------------------------------------- Worker : ResponseObject --------------------------------------------#	
Check ResponseObject App Success Thing	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    ${\n}==ResponseObject==

	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    # Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	# Log To Console    resp_jsonLog${resp_jsonLog}
	${reponseThingInfo}=    Set Variable    ${resp_jsonLog['ThingInfo']}
    # Log To Console    reponseWorkersInfo${reponseThingInfo}

	${checkCreatedDateTime}=    Set Variable    ${reponseThingInfo['CreatedDatetime']}
	${CreatedDateTime}=    Set Variable If    '${checkCreatedDateTime}'!='None'    ${reponseThingInfo['CreatedDatetime']}
	...    null

	${checkLastUpdatedTimestamp}=    Set Variable    ${reponseThingInfo['LastUpdatedTimestamp']}	
	${LastUpdatedTimestamp}=    Set Variable If    '${checkLastUpdatedTimestamp}'!='None'    ${reponseThingInfo['LastUpdatedTimestamp']}
 	...    null  

	Log    ${response}
	${ThingInfo}=    Set Variable    ${response['ThingInfo']}
	Log    ${ThingInfo}
	
	${checkWorkerId}=    Run Keyword And Return Status    Set Variable    ${ThingInfo['WorkerId']}
	${WorkerId}=    Set Variable If    '${checkWorkerId}'=='True'    "${ThingInfo['WorkerId']}"
	...    null
	
	${ThingState}=    Set Variable If    '${checkWorkerId}'=='True'    ${VALUE_THINGSTATE_IDLE}
	...    ${VALUE_THINGSTATE_PENDING}

	${ThingId}=    Set Variable     ${ThingInfo['ThingId']}
	${ThingName}=    Set Variable     ${ThingInfo['ThingName']}
	${ConnectivityType}=    Set Variable     ${ThingInfo['ConnectivityType']}
	${ThingIdentifier}=    Set Variable     ${ThingInfo['ThingIdentifier']}
	${ThingSecret}=    Set Variable     ${ThingInfo['ThingSecret']}
	${IMEI}=    Set Variable     ${ThingInfo['IMEI']}
	${ThingState}=    Set Variable     ${ThingInfo['ThingState']}
	${CustomDetails}=    Set Variable     'CustomDetails':${ThingInfo['CustomDetails']}
    ${replaceTextCustomDetails}=    Replace String    ${CustomDetails}    '    "
    ${removeSpaceTextCustomDetails}=    Replace String    ${replaceTextCustomDetails}    :${SPACE}    :
	${SupplierDetail}=    Set Variable    ${ThingInfo['SupplierDetail']}

	#check SupplierId
	${checkSupplierId}=    Run Keyword And Return Status    Set Variable    ${SupplierDetail['SupplierId']}
	${SupplierId}=    Set Variable If    '${checkSupplierId}'=='True'     ${SupplierDetail['SupplierId']}
	...   null
	#check SupplierName
	${checkSupplierName}=    Run Keyword And Return Status    Set Variable    ${SupplierDetail['SupplierName']}
	${SupplierName}=    Set Variable If    '${checkSupplierName}'=='True'     ${SupplierDetail['SupplierName']}
	...   null

    ${value_db}=    Set Variable If    '${checkSupplierId}'=='True' and '${checkSupplierName}'=='True'    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING}
	...    '${SupplierDetail}'=='null' and '${checkSupplierId}'=='False' and '${checkSupplierName}'=='False'    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING_SUPPLIERDETAILNULL}
	...    '${SupplierDetail}'!='null' and '${checkSupplierId}'=='False' and '${checkSupplierName}'=='False'    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING_SUPNULL}

	${replaceCode}    Replace String    ${value_db}    [Code]    ${code}  
	${replaceDescription}=    Replace String    ${replaceCode}    [DeveloperMessage]    ${description}
	${replaceThingId}=    Replace String    ${replaceDescription}    [ThingId]    ${ThingId}
	${replaceThingName}=    Replace String    ${replaceThingId}    [ThingName]    ${ThingName}
	${replaceThingState}=    Replace String    ${replaceThingName}    [ThingState]    ${ThingState}
	${replaceWorkerId}=    Replace String    ${replaceThingState}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingIdentifier}=    Replace String    ${replaceConnectivityType}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceCustomDetails}=    Replace String    ${replaceIMEI}    [CustomDetails]    ${removeSpaceTextCustomDetails}
	${replaceSupplierId}=    Replace String    ${replaceCustomDetails}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${replaceCreatedDateTime}=    Replace String    ${replaceSupplierName}    [CreatedDatetime]    ${CreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
    ${responseObject}=    Replace String To Object    ${replaceLastUpdatedTimestamp}

    ${responseObject_Replace}=    Replace String    ${responseObject}    "null"    null
	Log    ${responseObject_Replace}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject_Replace}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


Check ResponseObject App Success ThingReturnAListOfThings Get All	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Log To Console    ${\n}==ResponseObject==
 
	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    # Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	# Log To Console    resp_jsonLog${resp_jsonLog}
	${reponseThingInfo_Actual}=    Set Variable    ${resp_jsonLog['ThingInfo']}
    Log    ${reponseThingInfo_Actual}

    Log    ${body}
    ${bodyMatchCaseTop}=    Run Keyword And Return Status    Should Match Regexp    ${body}    .*Top.*
    ${bodyMatchCasePage}=    Run Keyword And Return Status    Should Match Regexp    ${body}    .*Page.*
    ${bodyMatchCaseSelect}=    Run Keyword And Return Status    Should Match Regexp    ${body}    .*Select.*
    ${bodyMatchCaseFillter}=    Run Keyword And Return Status    Should Match Regexp    ${body}    .*Filter.*

    Run Keyword if    '${bodyMatchCaseFillter}'=='True' and '${bodyMatchCaseSelect}'=='False'    Check ResponseObject ThingReturnAListOfThings Filter    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName} 
    Run Keyword if    '${bodyMatchCaseSelect}'=='True'    Check ResponseObject ThingReturnAListOfThings Select ThingSecret    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}     
	
	${Body_Expect}=    Evaluate    json.loads(r'''${body}''')    json
    ${Top_Expect}=    Set Variable If    '${bodyMatchCaseTop}'=='True'    ${Body_Expect['$Top']}
    ${Page_Expect}=    Set Variable If    '${bodyMatchCasePage}'=='True'    ${Body_Expect['$Page']}

	${Metadata_Actual}=    Set Variable    ${resp_jsonLog['@Metadata']}
	${Top_Status}=    Run Keyword And return Status    Set Variable    ${Metadata_Actual['Top']}	
	${Page_Status}=    Run Keyword And return Status    Set Variable    ${Metadata_Actual['Page']}	
    ${Top_Actual}=    Set Variable If    '${Top_Status}'=='True'    ${Metadata_Actual['Top']}
    ${Page_Actual}=    Set Variable If    '${Page_Status}'=='True'    ${Metadata_Actual['Page']}
    ${Top_Actual_Str}=    Convert To String    ${Top_Actual}
    ${Page_Actual_Str}=    Convert To String    ${Page_Actual}

	Log To Console    Filter Expect = ${body} 
	Log To Console    Top : Expect : ${Top_Expect} = Expect : ${Top_Actual}
	Log To Console    Page : Expect : ${Page_Expect} = Expect : ${Page_Actual}
    Run Keyword If    '${bodyMatchCaseTop}'=='True' and '${Top_Status}'=='True'    Run Keyword And Continue On Failure    Should Be Equal    ${Top_Expect}    ${Top_Actual_Str}
    Run Keyword If    '${bodyMatchCasePage}'=='True' and '${Top_Status}'=='False'    Run Keyword And Continue On Failure    Should Be Equal    ${Page_Expect}    ${Page_Actual_Str}

    Run Keyword And Continue On Failure    Should Not Be Empty    ${reponseThingInfo_Actual}
    Run Keyword And Continue On Failure    Should Not Be Empty    ${Metadata_Actual}
	${OperationStatus}=    Set Variable    ${resp_jsonLog['OperationStatus']}
	Check Json Data Should Be Equal    ${OperationStatus}    ['${FIELD_LOG_DETAIL_OPERATIONSTATUS_CODE}']    ${code}    ${FIELD_LOG_DETAIL_OPERATIONSTATUS_CODE}
	Check Json Data Should Be Equal    ${OperationStatus}    ['${FIELD_LOG_DETAIL_OPERATIONSTATUS_DEVELOPERMESSAGE}']    ${description}    ${FIELD_LOG_DETAIL_OPERATIONSTATUS_DEVELOPERMESSAGE}


Check ResponseObject ThingReturnAListOfThings Filter	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    Log    ${dataResponse}
	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    # Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	# Log To Console    resp_jsonLog${resp_jsonLog}
	${reponseThingInfo}=    Set Variable    ${resp_jsonLog['ThingInfo']}
    # Log To Console    reponseWorkersInfo${reponseThingInfo}


    ${ThingInfo}=    Set Variable    ${reponseThingInfo}
	Log    ${ThingInfo}
	${CreatedDateTime}=    Set Variable     ${ThingInfo[0]['CreatedDatetime']}
	${LastUpdatedTimestamp}=    Set Variable     ${ThingInfo[0]['LastUpdatedTimestamp']}
        
	#Expect
	${ThingInfo_Expect}=    Set Variable    ${response['ThingInfo'][0]}
	Log    ${ThingInfo_Expect}

    ${checkWorkerId}=    Run Keyword and Return Status    Set Variable    ${ThingInfo_Expect['WorkerId']}
	${WorkerId}=    Set Variable If    '${checkWorkerId}'=='True'    "${ThingInfo_Expect['WorkerId']}"
	...    null
	
	${ThingState}=    Set Variable If    '${checkWorkerId}'=='True'    ${VALUE_THINGSTATE_IDLE}
	...    ${VALUE_THINGSTATE_PENDING}

	${ThingId}=    Set Variable     ${ThingInfo_Expect['ThingId']}
	${ThingName}=    Set Variable     ${ThingInfo_Expect['ThingName']}
	${ConnectivityType}=    Set Variable     ${ThingInfo_Expect['ConnectivityType']}
	${ThingIdentifier}=    Set Variable     ${ThingInfo_Expect['ThingIdentifier']}
	${ThingSecret}=    Set Variable     ${ThingInfo_Expect['ThingSecret']}
	${IMEI}=    Set Variable     ${ThingInfo_Expect['IMEI']}
	${ThingState}=    Set Variable     ${ThingInfo_Expect['ThingState']}
	${CustomDetails}=    Set Variable     'CustomDetails':${ThingInfo_Expect['CustomDetails']}
    ${replaceTextCustomDetails}=    Replace String    ${CustomDetails}    '    "
    ${removeSpaceTextCustomDetails}=    Replace String    ${replaceTextCustomDetails}    :${SPACE}    :
	${SupplierDetail}=    Set Variable    ${ThingInfo_Expect['SupplierDetail']}

    #check SupplierId
	${checkSupplierId}=    Run Keyword And Return Status    Set Variable    ${SupplierDetail['SupplierId']}
	${SupplierId}=    Set Variable If    '${checkSupplierId}'=='True'     ${SupplierDetail['SupplierId']}
	...   null
	Log    ${SupplierId}
    #check SupplierName
	${checkSupplierName}=    Run Keyword And Return Status    Set Variable    ${SupplierDetail['SupplierName']}
	${SupplierName}=    Set Variable If    '${checkSupplierName}'=='True'     ${SupplierDetail['SupplierName']}
	...   null
	Log    ${SupplierName}

	${Body_Expect}=    Evaluate    json.loads(r'''${body}''')    json

	${bodyMatchCaseSelect}=    Run Keyword And Return Status    Should Match Regexp    ${body}    .*Select.*
    ${bodyMatchCaseFillter}=    Run Keyword And Return Status    Should Match Regexp    ${body}    .*Filter.*
	${CheckStatus_Select}=    Run Keyword And Return Status    Set Variable    ${Body_Expect['$Select']}
    ${Case_Select_ThingSecret}=    Set Variable If    '${CheckStatus_Select}'=='True'    ${Body_Expect['$Select']}
        

    ${value_db}=    Set Variable If    '${bodyMatchCaseFillter}'=='True'    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_RETURNALISTOFTHING}
    ...    '${bodyMatchCaseSelect}'=='True' and '${CheckStatus_Select}'=='True'    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_RETURNALISTOFTHING_CASESELECT}

	${replaceCode}    Replace String    ${value_db}    [Code]    ${code}  
	${replaceDescription}=    Replace String    ${replaceCode}    [DeveloperMessage]    ${description}
	${replaceThingId}=    Replace String    ${replaceDescription}    [ThingId]    ${ThingId}
	${replaceThingName}=    Replace String    ${replaceThingId}    [ThingName]    ${ThingName}
	${replaceThingState}=    Replace String    ${replaceThingName}    [ThingState]    ${ThingState}
	${replaceWorkerId}=    Replace String    ${replaceThingState}    [WorkerId]    ${WorkerId}
	${replaceConnectivityType}=    Replace String    ${replaceWorkerId}    [ConnectivityType]    ${ConnectivityType}
	${replaceThingIdentifier}=    Replace String    ${replaceConnectivityType}    [ThingIdentifier]    ${ThingIdentifier}
	${replaceThingSecret}=    Replace String    ${replaceThingIdentifier}    [ThingSecret]    ${ThingSecret}
	${replaceIMEI}=    Replace String    ${replaceThingSecret}    [IMEI]    ${IMEI}
	${replaceCustomDetails}=    Replace String    ${replaceIMEI}    [CustomDetails]    ${removeSpaceTextCustomDetails}
	${replaceSupplierId}=    Replace String    ${replaceCustomDetails}    [SupplierId]    ${SupplierId}
	${replaceSupplierName}=    Replace String    ${replaceSupplierId}    [SupplierName]    ${SupplierName}
	${replaceCreatedDateTime}=    Replace String    ${replaceSupplierName}    [CreatedDatetime]    ${CreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
    ${responseObject}=    Replace String To Object    ${replaceLastUpdatedTimestamp}
	Log    ${responseObject}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']   ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

Check ResponseObject ThingReturnAListOfThings Select ThingSecret	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    Log    ${dataResponse}
    Log    ${response}
	${reponseObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']}
    # Log To Console    reponseObjectData${reponseObjectData}
	${resp_jsonLog}=    Evaluate    json.loads(r'''${reponseObjectData}''')    json
	# Log To Console    resp_jsonLog${resp_jsonLog}

	${ThingInfo_Expect}=    Set Variable    ${response['ThingInfo'][0]}
	Log    ${ThingInfo_Expect}
	${ThingSecret}=    Set Variable     ${ThingInfo_Expect['ThingSecret']}

	${replaceCode}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_RETURNALISTOFTHING_CASESELECTHINGSECRET}    [Code]    ${code}  
	${replaceDescription}=    Replace String    ${replaceCode}    [DeveloperMessage]    ${description}
	${replaceThingSecret}=    Replace String    ${replaceDescription}    [ThingSecret]    ${ThingSecret}
    ${responseObject}=    Replace String To Object    ${replaceThingSecret}
	Log    ${responseObject}
    ${response}=    Set Variable    ${dataResponse} 
	Log    ${response}
	#Check Value
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']   ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

Check ResponseObject DeleteAThing Success  
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}
	Log To Console    ResponseObject Error
    Log To Console    ${\n}==ResponseObject Error==
	# ${code}=    Set Variable    ${code}
	# ${code} =	Set Variable If    '${code}'=='${VALUE_LOG_CODE_40300}'    ${VALUE_LOG_CODE_40400}
	# ...    '${code}'!='${VALUE_LOG_CODE_40300}'    ${code}
	# Log To Console    code${code}
	# Log To Console    description${description}
	# Log To Console    dataResponse${dataResponse}

	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [DeveloperMessage]    ${description}

	${responseObject}=    Replace String To Object    ${replaceDescriptionCmdName}
	# Log To Console    responseObjectError${responseObject}
			
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}



##############################################################################################################################################################


#======================================================================= Check RequestObject and Response MappingIMEI ==========================================================================================================================================================#
Check RequestObject App Success MappingIMEI
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}
	Log To Console    :: Check RequestObject App Success MappingIMEI   

	# ${routeParamteters}=    Set Variable If    '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${EMPTY}         
	# ...    '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    "routeParamteters":{"WorkerId":"[WorkerId]"},   

    
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}   
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${userAgent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
	# ${WorkerId}=    Set Variable If    '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'     ${resp_jsonReq['routeParamteters']['WorkerId']}
	# ...    '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${EMPTY}
 

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_MAPPINGIMEI}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceUserAgent}=    Replace String    ${replaceX_Ais_SessionId}    [user-agent]    ${userAgent}
	# ${replaceRouteParamteters}=    Replace String    ${replaceX_Ais_SessionId}    [routeParamteters]    ${routeParamteters}
	# ${replaceWorkerId}=    Replace String    ${replaceRouteParamteters}    [WorkerId]    ${WorkerId}
	${replaceBody}=    Replace String    ${replaceUserAgent}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}




#======================================================================= Check RequestObject and Response DeleteRawThing ==========================================================================================================================================================#
Check RequestObject App Success DeleteRawThing
    [Arguments]    ${dataResponse}    ${pathUrl}   ${tid}    ${body}
	Log To Console    :: Check RequestObject App Success DeleteRawThing

    
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_B3_Sampled}=    Set Variable    ${resp_jsonReq['headers']['x-b3-sampled']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${ThingId}=    Set Variable    ${resp_jsonReq['routeParameters']['ThingId']}
	${Url}=    Set Variable    ${resp_jsonReq['url']}
	${userAgent}=    Set Variable    ${resp_jsonReq['headers']['User-Agent']}
 

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETERAWTHING}    [valuePathUrl]    ${Url}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceX_Request_Id}=    Replace String    ${replaceTid}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_B3_Sampled}=    Replace String    ${replaceX_B3_SpanId}    [x-b3-sampled]    ${X_B3_Sampled}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_Sampled}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceRouteParameters}=    Replace String    ${replaceX_Ais_SessionId}    [ThingId]    ${ThingId}
	${replaceUserAgent}=    Replace String    ${replaceRouteParameters}    [user-agent]    ${userAgent}
	${requestObject}=    Replace String To Object    ${replaceUserAgent}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}






