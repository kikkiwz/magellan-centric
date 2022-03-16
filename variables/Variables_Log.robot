*** Variables ***

#log
${VALUE_LOG_URL}    mg-iot.siamimo.com

#namespace
${VALUE_LOG_NAMESPACE}    mgcentric 

#containerId : centricapis
${VALUE_LOG_CONTAINERID_CENTRIC}    centricapis-v326

#-------------------------------------------- Detail Log --------------------------------------------#
#endPointName : ProvisioningAPIs
${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}    ProvisioningAPIs

#log Detail
${VALUE_DETAIL}    Detail  
#field log Detail
${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_DETAIL_LOGTYPE}    logType  
${FIELD_LOG_DETAIL_LOGLEVEL}    logLevel  
${FIELD_LOG_DETAIL_NAMESPACE}    namespace  
${FIELD_LOG_DETAIL_APPLICATIONNAME}    applicationName  
${FIELD_LOG_DETAIL_CONTAINERID}    containerId
${FIELD_LOG_DETAIL_SESSIONID}    sessionId  
${FIELD_LOG_DETAIL_TID}    tid 
${FIELD_LOG_DETAIL_CUSTOM1}    custom1   
${FIELD_LOG_DETAIL_CUSTOM2}    custom2   
${FIELD_LOG_DETAIL_ENDPOINTNAME}    endPointName
${FIELD_LOG_DETAIL_REQUESTOBJECT}    requestObject
${FIELD_LOG_DETAIL_URL}    url
${FIELD_LOG_DETAIL_HEADERS}    headers
${FIELD_LOG_DETAIL_XAISORDERREF}    x-ais-OrderRef
${FIELD_LOG_DETAIL_BODY}    body
${FIELD_LOG_DETAIL_IMSI}    Imsi
${FIELD_LOG_DETAIL_IPADDRESS}    IpAddress        
${FIELD_LOG_DETAIL_RESPONSEOBJECT}    responseObject
${FIELD_LOG_DETAIL_THINGTOKEN}    ThingToken
${FIELD_LOG_DETAIL_THINGINFO}    ThingInfo
${FIELD_LOG_DETAIL_METADATA}    @Metadata
${FIELD_LOG_DETAIL_OPERATIONSTATUS}    OperationStatus
${FIELD_LOG_DETAIL_OPERATIONSTATUS_CODE}    Code
${FIELD_LOG_DETAIL_OPERATIONSTATUS_DESCRIPTION}    Description
${FIELD_LOG_DETAIL_ACTIVITYLOG}    activityLog
${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}    startTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}    endTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}    processTime
${FIELD_LOG_DETAIL_OPERATIONSTATUS_DEVELOPERMESSAGE}    DeveloperMessage

${FIELD_LOG_DETAIL_QUERYSTRING}    queryString

${VALUE_LOG_DETAIL_LOGLEVEL}    INFO  
${VALUE_LOG_DETAIL_CUSTOM2}    ${NONE}
${VALUE_LOG_DETAIL_VERSION}    v1

#-------------------------------------------- Detail Centric --------------------------------------------#
#-------------------------------------------- Workers --------------------------------------------#
#-------------------------------------------- requestObject and responseObject Workers --------------------------------------------#
#{'requestObject': '{"url":"/api/v1/Workers","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.24.0","Content-Length":"160","x-real-ip":"58.8.178.250","x-forwarded-for":"58.8.178.250","x-forwarded-proto":"https","x-ais-orderref":"CreateAWorker_31082021123730","x-ais-orderdesc":"CreateAWorker","x-request-id":"70771c4f-c103-4769-9620-dc16d8b693d9","x-b3-traceid":"765df7ca03dbe27f6ddadaf7f5de94b8","x-b3-spanid":"6ddadaf7f5de94b8","x-b3-sampled":"0","x-ais-SessionId":"1630388249346"},"queryString":{},"routeParamteters":{},"body":{"WorkerName":"Worker328701","ServerProperties":{"ServerIP":"127.0.2.2","ServerPort":"8080","ServerDomain":"Worker001.com"},"WorkerState":"Activated"}}
# routeParameters
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"routeParameters":[routeParameters],"body":[body]}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOBODY}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"routeParameters":[routeParameters]}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOBODYROUTEPARAMETERS}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString]}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_WORKER_NOROUTEPARAMETERS}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"body":[body]}"

#'responseObject': '{"WorkersInfo":{"WorkerId":"612de14fa9c8030001ce2be4","WorkerName":"Worker220146","ServerProperties":{"ServerIP":"127.0.2.2","ServerPort":"8080","ServerDomain":"Worker001.com"},"WorkerState":"Activated","CreatedDatetime":"2021-08-31T14:59:11.5463124+07:00","LastUpdatedTimestamp":"2021-08-31T14:59:11.5463125+07:00"},"OperationStatus":{"Code":"20100","DeveloperMessage":"Successfully created."}}'
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_WORKER}    "{"WorkersInfo":{"WorkerId":"[WorkerId]","WorkerName":"[WorkerName]","ServerProperties":{"ServerIP":"[ServerIP]","ServerPort":"[ServerPort]","ServerDomain":"[ServerDomain]"},"WorkerState":"[WorkerState]","CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"

# 'responseObject': '{"ThingInfo":[{"ThingId":"61372947dc3a5200016fc8b6","WorkerId":"61372946dc3a5200016fc8b4","ConnectivityType":"NBIOT","ThingName":"ThingName51854556","ThingIdentifier":"8966035092700427709","ThingSecret":"10792095810481292802","IMEI":"99681283779348739077","ThingState":"Idle","CustomDetails":{},"SupplierDetail":{"SupplierId":"SupplierId51854556","SupplierName":"SupplierName51854556"},"CreatedDatetime":"2021-09-07T08:56:39.081Z","LastUpdatedTimestamp":"2021-09-07T08:56:39.081Z"}],"@Metadata":{"CurrentPage":1,"TotalPages":1,"Top":10,"TotalCount":1,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}'
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_WORKER_EXPORTSLISTOFTHINGBYWORKERID}    {"ThingInfo":[{"ThingId":"[ThingId]","WorkerId":"[WorkerId]","ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]","CustomDetails":{},"SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"}],"@Metadata":{"CurrentPage":1,"TotalPages":1,"Top":10,"TotalCount":1,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}    
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_WORKER_UPDATETHINGSTOWORKERS}    {"ThingInfo":{"ThingId":"[ThingId]","WorkerId":"[WorkerId]","ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]","CustomDetails":{},"SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}    

#--------------------------------------------------------------- Whitelist --------------------------------------------#
#-------------------------------------------- requestObject and responseObject Whitelist --------------------------------------------#
#'requestObject': {"url":"/api/v1/Owners/61233d9e5580260001681301/Whitelist","method":"PUT","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"44","x-real-ip":"182.52.215.171","x-forwarded-for":"182.52.215.171","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"UpdateAWhitelist_23082021131807","x-ais-orderdesc":"UpdateAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFByvXOce/abU4gXs7h97sa3NwyGuHPQEYtVKVegMrc8SMg==","x-request-id":"0a380994-3dca-447f-bf19-c98a96e0a290","x-b3-traceid":"173fcd606da631d36def7c13efccdd43","x-b3-spanid":"6def7c13efccdd43","x-b3-sampled":"0","x-ais-SessionId":"1629699487908"},"queryString":{},"routeParamteters":{"OwnerId":"61233d9e5580260001681301"},"body":{"ThingIdentifier":["8966039942760640001"]}}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CREATEWHITELIST}    "{"url":"[valuePathUrl]","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"CreateAWhitelist","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"routeParameters":{},"body":[body]}"    

#'[{"OwnerType":"Account","OwnerId":"6125b01b55802600016863de","ThingIdentifierAlreadyExists":null,"ThingIdentifier":"[]","Status":"40000","StatusDescription":"The client requested missing or invalid  format."}]
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST}    [{"OwnerType":"[OwnerType]","OwnerId":"[OwnerId]","ThingIdentifierAlreadyExists":"[]","ThingIdentifier":"[ThingIdentifier]","Status":"[Status]","StatusDescription":"[StatusDescription]"}]   

#'[{"OwnerType":"Tenant","OwnerId":"6127ac6bcd16c6000129273e","ThingIdentifierAlreadyExists":"[]","ThingIdentifier":"[\"8966032662764236929\"]","Status":"20100","StatusDescription":"The requested operation was successfully."}]
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST_ERROR}    [{"OwnerType":[OwnerType],"OwnerId":[OwnerId],"ThingIdentifierAlreadyExists":[ThingIdentifierAlreadyExists],"ThingIdentifier":"[ThingIdentifier]","Status":"[Status]","StatusDescription":"[StatusDescription]"}]   

#'	[{"OwnerType":"Tenant","OwnerId":"61260833cd16c60001286211","ThingIdentifierAlreadyExists":"[\"12345\"]","ThingIdentifier":null,"Status":"40400","StatusDescription":"The ThingIdentifier could not be found."}]
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST_ERROR2}    [{"OwnerType":"[OwnerType]","OwnerId":"[OwnerId]","ThingIdentifierAlreadyExists":"[ThingIdentifierAlreadyExists]","ThingIdentifier":null,"Status":"[Status]","StatusDescription":"[StatusDescription]"}]   

#'requestObject': {"url":"/api/v1/Whitelist","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"110","x-real-ip":"125.26.177.51","x-forwarded-for":"125.26.177.51","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"CreateAWhitelist_18082021133939","x-ais-orderdesc":"CreateAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBzUpPmxKvLtGVO/nSm4H61K11GOfyYbf5JKVegMrc8SMg==","x-request-id":"5b06e00a-6d6c-4019-98fb-8ef7bbec0b60","x-b3-traceid":"b0dac6546124c62c9ceb27cfac4e780d","x-b3-spanid":"9ceb27cfac4e780d","x-b3-sampled":"0","x-ais-SessionId":"1629268778684"},"queryString":{},"routeParamteters":{},"body":[{"OwnerType":"Customer","OwnerId":"611cab295580260001676eec","ThingIdentifier":["8966032879631346687"]}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_UPDATEAWHITELIST}    "{"url":"[valuePathUrl]","method":"PUT","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"UpdateAWhitelist","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},[routeParameters]"body":[body]}"    

#'requestObject': {"url":"/api/v1/Whitelist","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"110","x-real-ip":"125.26.177.51","x-forwarded-for":"125.26.177.51","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"CreateAWhitelist_18082021133939","x-ais-orderdesc":"CreateAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBzUpPmxKvLtGVO/nSm4H61K11GOfyYbf5JKVegMrc8SMg==","x-request-id":"5b06e00a-6d6c-4019-98fb-8ef7bbec0b60","x-b3-traceid":"b0dac6546124c62c9ceb27cfac4e780d","x-b3-spanid":"9ceb27cfac4e780d","x-b3-sampled":"0","x-ais-SessionId":"1629268778684"},"queryString":{},"routeParamteters":{},"body":[{"OwnerType":"Customer","OwnerId":"611cab295580260001676eec","ThingIdentifier":["8966032879631346687"]}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_UPDATEAWHITELIST_MISSING}    "{"url":"[valuePathUrl]","method":"PUT","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"UpdateAWhitelist","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"body":[body]}"    

#'responseObject': {"WhitelistInfo":{"WhitelistId":"61233d9ff3447100014fc336","OwnerType":"Customer","OwnerId":"61233d9e5580260001681301","ThingIdentifierAlreadyExists":[],"ThingIdentifier":["8966039942760640001"]},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_UPDATEAWHITELIST}    "{"WhitelistInfo":{"WhitelistId":"[WhitelistId]","OwnerType":"[OwnerType]","OwnerId":"[OwnerId]","ThingIdentifierAlreadyExists":[],"ThingIdentifier":["[ThingIdentifier]"]},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"    

#'requestObject': {"url":"/api/v1/Whitelist","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"110","x-real-ip":"125.26.177.51","x-forwarded-for":"125.26.177.51","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"CreateAWhitelist_18082021133939","x-ais-orderdesc":"CreateAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBzUpPmxKvLtGVO/nSm4H61K11GOfyYbf5JKVegMrc8SMg==","x-request-id":"5b06e00a-6d6c-4019-98fb-8ef7bbec0b60","x-b3-traceid":"b0dac6546124c62c9ceb27cfac4e780d","x-b3-spanid":"9ceb27cfac4e780d","x-b3-sampled":"0","x-ais-SessionId":"1629268778684"},"queryString":{},"routeParamteters":{},"body":[{"OwnerType":"Customer","OwnerId":"611cab295580260001676eec","ThingIdentifier":["8966032879631346687"]}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_RETURNSALISTOFWHITELIST}    "{"url":"[valuePathUrl]","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"ReturnsALitsOfWhitelist","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"routeParameters":{}}"    

#'requestObject': {"url":"/api/v1/Whitelist","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"110","x-real-ip":"125.26.177.51","x-forwarded-for":"125.26.177.51","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"CreateAWhitelist_18082021133939","x-ais-orderdesc":"CreateAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBzUpPmxKvLtGVO/nSm4H61K11GOfyYbf5JKVegMrc8SMg==","x-request-id":"5b06e00a-6d6c-4019-98fb-8ef7bbec0b60","x-b3-traceid":"b0dac6546124c62c9ceb27cfac4e780d","x-b3-spanid":"9ceb27cfac4e780d","x-b3-sampled":"0","x-ais-SessionId":"1629268778684"},"queryString":{},"routeParamteters":{},"body":[{"OwnerType":"Customer","OwnerId":"611cab295580260001676eec","ThingIdentifier":["8966032879631346687"]}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER}    "{"url":"[valuePathUrl]","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"GetAWhitelistbyThingIdentifier","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{}[routeParameters]}"    

#'requestObject': {"url":"/api/v1/Whitelist","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"110","x-real-ip":"125.26.177.51","x-forwarded-for":"125.26.177.51","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"CreateAWhitelist_18082021133939","x-ais-orderdesc":"CreateAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBzUpPmxKvLtGVO/nSm4H61K11GOfyYbf5JKVegMrc8SMg==","x-request-id":"5b06e00a-6d6c-4019-98fb-8ef7bbec0b60","x-b3-traceid":"b0dac6546124c62c9ceb27cfac4e780d","x-b3-spanid":"9ceb27cfac4e780d","x-b3-sampled":"0","x-ais-SessionId":"1629268778684"},"queryString":{},"routeParamteters":{},"body":[{"OwnerType":"Customer","OwnerId":"611cab295580260001676eec","ThingIdentifier":["8966032879631346687"]}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER_ROUNTNOTFOUND}    "{"url":"[valuePathUrl]","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"GetAWhitelistbyThingIdentifier","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{}}"    

#'responseObject': {"WhitelistInfo":{"WhitelistId":"6127106cf3447100014fe724","OwnerType":"Customer","OwnerId":"6127106bcd16c60001289102","ThingIdentifier":["8966037752022866066"],"CreatedDatetime":"2021-08-26T03:54:20.541Z","LastUpdatedTimestamp":"2021-08-26T03:54:20.541Z"},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER}    "{"WhitelistInfo":{"WhitelistId":"[WhitelistId]","OwnerType":"[OwnerType]","OwnerId":"[OwnerId]","ThingIdentifier":["[ThingIdentifier]"],"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"    

#'requestObject': {"url":"/api/v1/Owners/6126f024cd16c60001287b21/Whitelist","method":"DELETE","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"44","x-real-ip":"182.52.66.213","x-forwarded-for":"182.52.66.213","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"DeleteAWhitelist_26082021083638","x-ais-orderdesc":"DeleteAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBzduNX6LuvYD3fBbz10gMwE6pP1xzoMHF9KVegMrc8SMg==","x-request-id":"14c897e2-e5e4-4d9f-9582-a54a67faf7db","x-b3-traceid":"4ab9ebe7a2d283d2051e163451228939","x-b3-spanid":"051e163451228939","x-b3-sampled":"0","x-ais-SessionId":"1629941797710"},"queryString":{},"routeParamteters":{"OwnerId":"6126f024cd16c60001287b21"},"body":{"ThingIdentifier":["8966035377646432213"]}}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETEAWHITELIST}    "{"url":"[valuePathUrl]","method":"DELETE","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"DeleteWhitelist","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},[routeParameters]"body":[body]}"    

#'requestObject': {"url":"/api/v1/Whitelist","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"110","x-real-ip":"125.26.177.51","x-forwarded-for":"125.26.177.51","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"CreateAWhitelist_18082021133939","x-ais-orderdesc":"CreateAWhitelist","x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBzUpPmxKvLtGVO/nSm4H61K11GOfyYbf5JKVegMrc8SMg==","x-request-id":"5b06e00a-6d6c-4019-98fb-8ef7bbec0b60","x-b3-traceid":"b0dac6546124c62c9ceb27cfac4e780d","x-b3-spanid":"9ceb27cfac4e780d","x-b3-sampled":"0","x-ais-SessionId":"1629268778684"},"queryString":{},"routeParamteters":{},"body":[{"OwnerType":"Customer","OwnerId":"611cab295580260001676eec","ThingIdentifier":["8966032879631346687"]}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETEAWHITELIST_MISSING}    "{"url":"[valuePathUrl]","method":"DELETE","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"DeleteWhitelist","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"body":[body]}"    


#--------------------------------------------------------------- Capability --------------------------------------------#
#-------------------------------------------- requestObject and responseObject Capability --------------------------------------------#

#'requestObject': {"url":"/api/v1/Capability/Worker/612c59c42571d10001f0ac56/Thing/Verifies","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"105","x-real-ip":"182.52.212.44","x-forwarded-for":"182.52.212.44","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"VerifiesThings_30082021110836","x-ais-orderdesc":"VerifiesThings","x-request-id":"c443709c-556c-467a-9203-c4882b9ad5a1","x-b3-traceid":"ed6d1c852e98beb68ee7a725c04d0002","x-b3-spanid":"8ee7a725c04d0002","x-b3-sampled":"0","x-ais-SessionId":"1630296516785"},"queryString":{},"routeParameters":{"WorkerId":"612c59c42571d10001f0ac56"},"body":[{"ThingIdentifier":"8966038008976965764","ThingSecret":"160806227863427","IMEI":"493549072793293"}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_VERIFIESTHINGS}    "{"url":"[valuePathUrl]","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"VerifiesThings","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},[routeParameters]"body":[body]}"    

#'responseObject': [{"ThingId":null,"ThingName":null,"ThingIdentifier":"8966033887509109606","ThingSecret":"816113294633269","IMEI":"606380129810145","Status":"20000","StatusDescription":"Available"}]
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_VERIFIESTHINGS}    [{"ThingId":null,"ThingName":null,"ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","Status":"[Status]","StatusDescription":"[StatusDescription]"}]    

#'responseObject': [{"ThingId":null,"ThingName":null,"ThingIdentifier":"8966033201814594369","ThingSecret":"356108454206075","IMEI":"596950102127491","Status":"20000","StatusDescription":"Available"},{"ThingId":null,"ThingName":null,"ThingIdentifier":"8966035214823401750","ThingSecret":"608470944549673","IMEI":"516594705910928","Status":"20000","StatusDescription":"Available"}]
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_VERIFIESTHINGS2DATA}    [{"ThingId":null,"ThingName":null,"ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","Status":"[Status]","StatusDescription":"[StatusDescription]"},{"ThingId":null,"ThingName":null,"ThingIdentifier":"[ThingIdentifier2]","ThingSecret":"[ThingSecret2]","IMEI":"[IMEI2]","Status":"[Status2]","StatusDescription":"[StatusDescription2]"}]    



#'requestObject': {"url":"/api/v1/Capability/Worker/61303585f7c5ae00013677b8/Thing/Activates","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"105","x-real-ip":"182.52.66.65","x-forwarded-for":"182.52.66.65","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"ActivateThings_02092021092301","x-ais-orderdesc":"ActivateThings","x-request-id":"4155c27e-e6f8-4356-b8b6-8882b50958c3","x-b3-traceid":"695ece09c54fdb83e5227d51b707827c","x-b3-spanid":"e5227d51b707827c","x-b3-sampled":"0","x-ais-SessionId":"1630549381718"},"queryString":{},"routeParameters":{"WorkerId":"61303585f7c5ae00013677b8"},"body":[{"ThingIdentifier":"8966035555194402531","ThingSecret":"366784683967218","IMEI":"430951725264473"}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_ACTIVATETHINGS}    "{"url":"[valuePathUrl]","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"ActivateThings","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"routeParameters":{"WorkerId":"[WorkerId]"},"body":[body]}"    


#'responseObject': [{"ThingId":"61303585f7c5ae00013677bb","ThingName":"ThingName919467","ThingIdentifier":"8966035555194402531","ThingSecret":"366784683967218","IMEI":"430951725264473","SupplierDetail":{"SupplierId":"SupplierId919467","SupplierName":"SupplierName919467"},"Status":"20000","StatusDescription":"The requested operation was successfully."}]
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_ACTIVATETHINGS}    [{"ThingId":"[ThingId]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"Status":"[Status]","StatusDescription":"[StatusDescription]"}]    

#'responseObject': [{"ThingId":"61306be9f7c5ae0001367959","ThingName":"ThingName579265","ThingIdentifier":"8966034565611351909","ThingSecret":"167923653576547","IMEI":"989547151816118","SupplierDetail":{"SupplierId":"SupplierId579265","SupplierName":"SupplierName579265"},"Status":"20000","StatusDescription":"The requested operation was successfully."},{"ThingId":"61306becf7c5ae000136795c","ThingName":"ThingName390552","ThingIdentifier":"8966033464386895022","ThingSecret":"645933592107451","IMEI":"532570167234417","SupplierDetail":{"SupplierId":"SupplierId390552","SupplierName":"SupplierName390552"},"Status":"20000","StatusDescription":"The requested operation was successfully."}]
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_ACTIVATETHINGS2DATA}    [{"ThingId":"[ThingId]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"Status":"[Status]","StatusDescription":"[StatusDescription]"},{"ThingId":"[ThingId2]","ThingName":"[ThingName2]","ThingIdentifier":"[ThingIdentifier2]","ThingSecret":"[ThingSecret2]","IMEI":"[IMEI2]","SupplierDetail":{"SupplierId":"[SupplierId2]","SupplierName":"[SupplierName2]"},"Status":"[Status2]","StatusDescription":"[StatusDescription2]"}]    


#'requestObject': {"url":"/api/v1/Capability/Worker/61303585f7c5ae00013677b8/Thing/Activates","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"105","x-real-ip":"182.52.66.65","x-forwarded-for":"182.52.66.65","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"ThingTerminates_02092021092301","x-ais-orderdesc":"TerminatesThings","x-request-id":"4155c27e-e6f8-4356-b8b6-8882b50958c3","x-b3-traceid":"695ece09c54fdb83e5227d51b707827c","x-b3-spanid":"e5227d51b707827c","x-b3-sampled":"0","x-ais-SessionId":"1630549381718"},"queryString":{},"routeParameters":{"WorkerId":"61303585f7c5ae00013677b8"},"body":[{"ThingIdentifier":"8966035555194402531","ThingSecret":"366784683967218","IMEI":"430951725264473"}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_TERMINATESTHINGS}    "{"url":"[valuePathUrl]","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"TerminatesThings","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},[routeParameters]"body":[body]}"    


#'requestObject': {"url":"/api/v1/Capability/Worker/6136e920dc3a5200016fc4a4/Thing","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"0","x-real-ip":"182.52.212.147","x-forwarded-for":"182.52.212.147","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"ReturnsAListofThings_07092021112301","x-ais-orderdesc":"ReturnsAListofThings","x-request-id":"c1b8792a-d6aa-4ea5-8578-46f8211f3058","x-b3-traceid":"d5f1e0843be0f7458c3cfc2c0efa38ed","x-b3-spanid":"8c3cfc2c0efa38ed","x-b3-sampled":"0","x-ais-SessionId":"1630988580121"},"queryString":{},"routeParameters":{"WorkerId":"6136e920dc3a5200016fc4a4"}}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_RETURNSALISTOFTHINGS}    "{"url":"[valuePathUrl]","method":"GET","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[User-Agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"ReturnsAListofThings","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"routeParameters":{"WorkerId":"[WorkerId]"}}"    


#'responseObject': {"ThingInfo":[{"ThingId":"613732d8dc3a5200016fc9af","WorkerId":"613732d5dc3a5200016fc9a7","ConnectivityType":"NBIOT","ThingName":"ThingName841371","ThingIdentifier":"8966039226071424367","ThingSecret":"54291566594193147041","IMEI":"27204276089965136018","ThingState":"Idle","CustomDetails":{},"SupplierDetail":{"SupplierId":"SupplierId841371","SupplierName":"SupplierName841371"},"CreatedDatetime":"2021-09-07T09:37:28.885Z","LastUpdatedTimestamp":"2021-09-07T09:37:28.885Z"}],"@Metadata":{"CurrentPage":1,"TotalPages":2,"Top":1,"TotalCount":2,"HasPrevious":false,"HasNext":true},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_RETURNSALISTOFTHINGS}    "{"ThingInfo":[{"ThingId":"[ThingId]","WorkerId":"[WorkerId]","ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]","CustomDetails":{},"SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"}],"@Metadata":{"CurrentPage":[CurrentPage],"TotalPages":[TotalPages],"Top":[Top],"TotalCount":[TotalCount],"HasPrevious":[HasPrevious],"HasNext":[HasNext]},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"    



#-------------------------------------------- Thing --------------------------------------------#
#-------------------------------------------- requestObject and responseObject Workers --------------------------------------------#
#CreateAthing
#{"url":"/api/v1/Things","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip,deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.25.1","Content-Length":"281","x-real-ip":"58.8.214.60","x-forwarded-for":"58.8.214.60","x-forwarded-proto":"https","x-ais-orderref":"CreateAThing_08092021101332","x-ais-orderdesc":"CreateAThing","x-request-id":"b55b32aa-83ec-4c51-8120-a99e8465feca","x-b3-traceid":"a6a700b17fcf92bb6a448924da453654","x-b3-spanid":"6a448924da453654","x-b3-sampled":"0","x-ais-SessionId":"1631070812404"},"queryString":{},"routeParamteters":{},"body":{"ConnectivityType":"NBIOT","ThingName":"ThingName692644","ThingIdentifier":"9022438292167","ThingSecret":"93340371178762612815","IMEI":"22001888494868060136","CustomDetails":{},"SupplierDetail":{"SupplierId":"SupplierId692644","SupplierName":"SupplierName692644"}}}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"routeParameters":[routeParameters],"body":[body]}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING_METHINDNOTALLOWED}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"body":[body]}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_CREATETHING_NOBODY}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"routeParameters":[routeParameters]}"


#{"ThingInfo":{"ThingId":"61382a5cdc3a5200016fcebd","WorkerId":null,"ConnectivityType":"NBIOT","ThingName":"ThingName692644","ThingIdentifier":"8966039022438292167","ThingSecret":"93340371178762612815","IMEI":"22001888494868060136","ThingState":"Pending","CustomDetails":{},"SupplierDetail":{"SupplierId":"SupplierId692644","SupplierName":"SupplierName692644"},"CreatedDatetime":"2021-09-08T10:13:32.5130909+07:00","LastUpdatedTimestamp":"2021-09-08T10:13:32.5130911+07:00"},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING}    "{"ThingInfo":{"ThingId":"[ThingId]","WorkerId":[WorkerId],"ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]",[CustomDetails],"SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING_SUPNULL}    "{"ThingInfo":{"ThingId":"[ThingId]","WorkerId":[WorkerId],"ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]",[CustomDetails],"SupplierDetail":{"SupplierId":null,"SupplierName":null},"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING_SUPPLIERDETAILNULL}    "{"ThingInfo":{"ThingId":"[ThingId]","WorkerId":[WorkerId],"ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]",[CustomDetails],"SupplierDetail":null,"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"


${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING_GETALL}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_RETURNALISTOFTHING}    "{"ThingInfo":[{"ThingId":"[ThingId]","WorkerId":[WorkerId],"ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]",[CustomDetails],"SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"}],"@Metadata":{"CurrentPage":1,"TotalPages":1,"Top":10,"TotalCount":1,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_RETURNALISTOFTHING_CASESELECTHINGSECRET}    "{"ThingInfo":[{"ThingId":null,"WorkerId":null,"ConnectivityType":null,"ThingName":null,"ThingIdentifier":null,"ThingSecret":"[ThingSecret]","IMEI":null,"ThingState":null,"CustomDetails":null,"SupplierDetail":null,"CreatedDatetime":null,"LastUpdatedTimestamp":null}],"@Metadata":{"CurrentPage":1,"TotalPages":1,"Top":1,"TotalCount":1,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING_NOTFOUND}     {"ThingInfo":null,"@Metadata":{"CurrentPage":1,"TotalPages":0,"Top":10,"TotalCount":0,"HasPrevious":false,"HasNext":false},"OperationStatus":{"Code":"40400","DeveloperMessage":"The requested operation could not be found."}}

#UpdateAthing
#{"url":"/api/v1/Things/61397e76dc3a5200016fd967","method":"PUT","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip,deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.25.1","Content-Length":"372","x-real-ip":"119.76.33.253","x-forwarded-for":"119.76.33.253","x-forwarded-proto":"https","x-ais-orderref":"UpdateAThing_09092021102438","x-ais-orderdesc":"UpdateAThing","x-request-id":"74bf8ffd-6fea-4370-8d34-03bf70435a89","x-b3-traceid":"370c5381b9598474d6e583cfedf12e84","x-b3-spanid":"d6e583cfedf12e84","x-b3-sampled":"0","x-ais-SessionId":"1631157878931"},"queryString":{},"routeParamteters":{"ThingId":"61397e76dc3a5200016fd967"},"body":{"WorkerId":"61397e76dc3a5200016fd963","ConnectivityType":"CELLULAR","ThingName":"ThingName_Update361756","ThingIdentifier":"8966033548319968754","ThingSecret":"39182212382859911344","IMEI":"04780533896311752937","CustomDetails":{"CustomDetailsKey_Update":"361756"},"SupplierDetail":{"SupplierId":"SupplierId361756","SupplierName":"SupplierName361756"}}}
#${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CENTRIC_UPDATETHING}        "{"url":"[valuePathUrl]","method":"[method]","headers":{"Content-Type":"[content-type]","Accept":"*/*","Accept-Encoding":"[accept-encoding]","Host":"[host]","User-Agent":"[user-agent]","Content-Length":"[content-length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":[queryString],"routeParamteters":[routeParameters],"body":[body]}"
#{"ThingInfo":{"ThingId":"61382a5cdc3a5200016fcebd","WorkerId":null,"ConnectivityType":"NBIOT","ThingName":"ThingName692644","ThingIdentifier":"8966039022438292167","ThingSecret":"93340371178762612815","IMEI":"22001888494868060136","ThingState":"Pending","CustomDetails":{},"SupplierDetail":{"SupplierId":"SupplierId692644","SupplierName":"SupplierName692644"},"CreatedDatetime":"2021-09-08T10:13:32.5130909+07:00","LastUpdatedTimestamp":"2021-09-08T10:13:32.5130911+07:00"},"OperationStatus":{"Code":"20000","DeveloperMessage":"The requested operation was successfully."}}
#${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_UPDATETHING}    "{"ThingInfo":{"ThingId":"[ThingId]","WorkerId":[WorkerId],"ConnectivityType":"[ConnectivityType]","ThingName":"[ThingName]","ThingIdentifier":"[ThingIdentifier]","ThingSecret":"[ThingSecret]","IMEI":"[IMEI]","ThingState":"[ThingState]",[CustomDetails],"SupplierDetail":{"SupplierId":"[SupplierId]","SupplierName":"[SupplierName]"},"CreatedDatetime":"[CreatedDatetime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"},"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"


#--------------------------------------------------------------- Supplier --------------------------------------------#
#-------------------------------------------- requestObject and responseObject Supplier --------------------------------------------#


#'requestObject': {"url":"/api/v1/Things/Import","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"285","x-real-ip":"182.52.212.236","x-forwarded-for":"182.52.212.236","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"ImportThing_08092021105513","x-ais-orderdesc":"ImportThing","x-request-id":"42a1b569-869d-4df1-9918-dc3c76856ba3","x-b3-traceid":"7df39265086fbc35de92b380b2313833","x-b3-spanid":"de92b380b2313833","x-b3-sampled":"0","x-ais-SessionId":"1631073310662"},"queryString":{},"routeParameters":{},"body":[{"ConnectivityType":"NBIOT","ThingName":"ThingName19486859","ThingIdentifier":"8966036242364950787","ThingSecret":"84258823690714642180"},{"ConnectivityType":"WIFI","ThingName":"ThingName34868279","ThingIdentifier":"4930331185631","ThingSecret":"88033350101250980419"}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_IMPORTTHING}    "{"url":"[valuePathUrl]","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[user-agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"ImportThing","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"routeParameters":{},"body":[body]}"    


#'requestObject': {"url":"/api/v1/Things/Mapping/IMEI","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"171","x-real-ip":"118.175.221.85","x-forwarded-for":"118.175.221.85","x-forwarded-proto":"https","x-ais-orderref":"MappingIMEI_09092021131820","x-ais-orderdesc":"MappingIMEI","x-request-id":"c3259776-2366-48f1-b95a-cf3b47d17368","x-b3-traceid":"7322a603f818afd591673a8360f329f0","x-b3-spanid":"91673a8360f329f0","x-b3-sampled":"0","x-ais-SessionId":"1631168296046"},"queryString":{},"routeParameters":{},"body":[{"ConnectivityType":"NBIOT","ThingName":"ThingName413603","ThingIdentifier":"8966035152262132800","ThingSecret":"775762201224648","IMEI":"40928680952903879547"}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_MAPPINGIMEI}    "{"url":"[valuePathUrl]","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[user-agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-orderref":"[tid]","x-ais-orderdesc":"MappingIMEI","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"routeParameters":{},"body":[body]}"    


#'requestObject': {"url":"/api/v1/Things/6139e1c3064a3700017ad982/Raw","method":"DELETE","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"0","x-real-ip":"182.52.210.182","x-forwarded-for":"182.52.210.182","x-forwarded-proto":"https","x-ais-orderref":"RemoveAThing_09092021172824","x-ais-orderdesc":"DeleteRawThing","x-request-id":"b414ff4f-aeba-49e8-850e-9bffdebc130e","x-b3-traceid":"9e0615c8187ab7b257684b5971511e9c","x-b3-spanid":"57684b5971511e9c","x-b3-sampled":"0","x-ais-SessionId":"1631183299847"},"queryString":{},"routeParameters":{"ThingId":"6139e1c3064a3700017ad982"}}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETERAWTHING}    "{"url":"[valuePathUrl]","method":"DELETE","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[user-agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-orderref":"[tid]","x-ais-orderdesc":"DeleteRawThing","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"routeParameters":{"ThingId":"[ThingId]"}}"    

#'requestObject': {"url":"/api/v1/Things/Import","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"python-requests/2.26.0","Content-Length":"285","x-real-ip":"182.52.212.236","x-forwarded-for":"182.52.212.236","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"ImportThing_08092021105513","x-ais-orderdesc":"ImportThing","x-request-id":"42a1b569-869d-4df1-9918-dc3c76856ba3","x-b3-traceid":"7df39265086fbc35de92b380b2313833","x-b3-spanid":"de92b380b2313833","x-b3-sampled":"0","x-ais-SessionId":"1631073310662"},"queryString":{},"routeParameters":{},"body":[{"ConnectivityType":"NBIOT","ThingName":"ThingName19486859","ThingIdentifier":"8966036242364950787","ThingSecret":"84258823690714642180"},{"ConnectivityType":"WIFI","ThingName":"ThingName34868279","ThingIdentifier":"4930331185631","ThingSecret":"88033350101250980419"}]}
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_IMPORTTHINGBYSUPPLIER}    "{"url":"[valuePathUrl]","method":"POST","headers":{"Content-Type":"application/json","Accept":"*/*","Accept-Encoding":"gzip, deflate","Host":"mgcentric-iot.siamimo.com","User-Agent":"[user-agent]","Content-Length":"[Content-Length]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"https","x-ais-username":"AisPartner","x-ais-orderref":"[x-ais-orderref]","x-ais-orderdesc":"[x-ais-orderdesc]","x-request-id":"[x-request-id]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-sampled":"[x-b3-sampled]","x-ais-SessionId":"[x-ais-SessionId]"},"queryString":{},"routeParameters":[routeParameters],"body":[body]}"    




  
	


#-------------------------------------------- responseObject Success --------------------------------------------#
# 'responseObject': '{ "OperationStatus":{ "Code":"20000", "Description":"ValidateTokenProcess is Success" } }'
${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"

#-------------------------------------------- responseObject Error --------------------------------------------#
# #{ \"OperationStatus\":{ \"Code\":\"40000\", \"DeveloperMessage\":\"The client request missing or invalid format\" }, \"Detail\":[ { \"Target\":\"ThingIdentifier\", \"DeveloperMessage\":\"The length of ThingIdentifier must be 13 or 19 characters. You entered 20 characters.\" } ] }
# ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    "{\"OperationStatus\":{\"Code\":\"[Code]\",\"Description\":\"[Description]\"},\"Details\":[Detail]}"

#{ \"OperationStatus\":{ \"Code\":\"40000\", \"DeveloperMessage\":\"The client request missing or invalid format\" }, \"Detail\":[ { \"Target\":\"ThingIdentifier\", \"DeveloperMessage\":\"The length of ThingIdentifier must be 13 or 19 characters. You entered 20 characters.\" } ] }
${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]","Details":[Detail]}}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR1}    {"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]","Details":[Detail]}}

${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR1}    [[Detail],"Status":"[Code]","StatusDescription":"[DeveloperMessage]"}]

#{"OperationStatus":{"Code":"40400","DeveloperMessage":"The requested operation could not be found."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    "{\"OperationStatus\":{\"Code\":\"[Code]\",\"DeveloperMessage\":\"[DeveloperMessage]\"}}"

#{"OperationStatus":{"Code":"40400","DeveloperMessage":"The requested operation could not be found."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR2}    "{\"ModelState":null\,"OperationStatus\":{\"Code\":\"[Code]\",\"Description\":\"[Description]\"}}"


#-------------------------------------------- Detail DB--------------------------------------------#
# "responseObject":"{"statusCode":"20000","description":"inquiry worker is success"}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_DB}    {}    
${VALUE_LOG_DETAIL_RESPONSEOBJECT_WHITELIST_DB}    {"StatusCode":[statusCode],"Description":"[description]"}

#-------------------------------------------- Summary Log --------------------------------------------#
${VALUE_SUMMARY}    Summary 
#field log Summary
${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_SUMMARY_LOGTYPE}    logType  
${FIELD_LOG_SUMMARY_NAMESPACE}    namespace
${FIELD_LOG_SUMMARY_APPLICATIONNAME}    applicationName
${FIELD_LOG_SUMMARY_CONTAINERID}    containerId
${FIELD_LOG_SUMMARY_SESSIONID}    sessionId
${FIELD_LOG_SUMMARY_TID}    tid 
${FIELD_LOG_SUMMARY_IDENTITY}    identity 
${FIELD_LOG_SUMMARY_CMDNAME}    cmdName  
${FIELD_LOG_SUMMARY_RESULTCODE}    resultCode  
${FIELD_LOG_SUMMARY_RESULTDESC}    resultDesc
${FIELD_LOG_SUMMARY_CUSTOM}    custom
${FIELD_LOG_SUMMARY_CUSTOMDATA}    customData
${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}    endPointSummary
${FIELD_LOG_SUMMARY_REQTIMESTAP}    reqTimestamp 
${FIELD_LOG_SUMMARY_RESTIMESTAMP}    resTimestamp  
${FIELD_LOG_SUMMARY_USAGETIME}    usageTime 

#value log summary  cmdName: "Worker"
${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}    CreateWorkers
${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}    UpdateWorkers
${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}    PartialUpdateWorkers
${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}    GetWorkers
${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}    GetWorkersById
${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}    DeleteWorkersById
${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}    Import
${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}    Export
${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}    ThingAssign
${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}    newWorkerAssign
${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}    DeleteThingsFromWorkers

${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}    RouteMethodNotAllowed

#value log summary  cmdName: Whitelist
${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}    CreateWhiteList2
${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWHITELIST}    GetWhitelistLists
${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}    GetWhitelistByThingIdentifier
${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}    UpdateWhiteList
${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}    DeleteWhitelistByOwner
${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}    RouteNotFound


#value log summary  cmdName: VerifiesThings
${VALUE_LOG_SUMMARY_CMDNAME_VERIFIES}    ThingVerifies

#value log summary  cmdName: ActivateThings
${VALUE_LOG_SUMMARY_CMDNAME_ACTIVATETHINGS}    ThingActivates

#value log summary  cmdName: TerminatesThings
${VALUE_LOG_SUMMARY_CMDNAME_TERMINATESTHINGS}    ThingTerminates

#value log summary  cmdName: ReturnsAListofThings
${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}    GetThingsByWorkerId

#value log summary  cmdName: "Thing"
${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}    CreateThings
${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}    UpdateThings
${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}    PartialUpdateThings
${VALUE_LOG_SUMMARY_CMDNAME_REOUTMETHODNOTALLOWED}    RouteMethodNotAllowed
${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}    ThingReturnAListOfThings
${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS_Final}    GetThings
${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}    GetThingsById
${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}    DeleteThingsById

#value log summary  cmdName: ImportThing
${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHING}    Import

#value log summary  cmdName: ImportThingBySupplierId
${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}    ImportWithSupplierId

#value log summary  cmdName: MappingIMEI
${VALUE_LOG_SUMMARY_CMDNAME_MAPPINGIMEI}    MappingIMEI

#value log summary  cmdName: DeleteRawThing
${VALUE_LOG_SUMMARY_CMDNAME_DELETERAWTHING}    RemoveThingsById


${VALUE_LOG_SUMMARY_IDENTITY}    ${NONE}
${VALUE_LOG_SUMMARY_CUSTOM}    ${NONE}
${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${EMPTY}

${VALUE_LOG_CODE_20000}    20000
${VALUE_LOG_CODE_20100}    20100
${VALUE_LOG_CODE_40000}    40000
${VALUE_LOG_CODE_40300}    40300
${VALUE_LOG_CODE_40400}    40400
${VALUE_LOG_CODE_40301}    40301
${VALUE_LOG_CODE_40305}    40305
${VALUE_LOG_CODE_40010}    40010
${VALUE_LOG_CODE_40308}    40308
${VALUE_LOG_CODE_40103}    40103
${VALUE_LOG_CODE_40500}    40500
${VALUE_LOG_CODE_50099}    50099

${VALUE_LOG_SUMMARY_RESULTDESC_OK}    OK

# ${VALUE_LOG_SUMMARY_RESULTDESC_20000_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully
${VALUE_DESCRIPTION_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully

#status
${VALUE_STATUS_SUCCESS}     Success
${VALUE_STATUS_WHITELISTALREADY}     WhitelistAlready

#response description
${VALUE_DESCRIPTION_REGISTER_SUCCESS}    Register is Success
${VALUE_DESCRIPTION_REPORT_SUCCESS}     Report is Success
${VALUE_DESCRIPTION_IS_SUCCESS}     is Success

${VALUE_DESCRIPTION_SUCCESS}     Success

#Error
${VALUE_DESCRIPTION_THEIMSITHINGTOKENISNOTFOUND_ERROR}    The Imsi/ThingToken is Not Found
${VALUE_DESCRIPTION_FORBIDDEN_ERROR}    Forbidden
${VALUE_DESCRIPTION_INVALIDPAYLOAD_ERROR}    InvalidPayload

${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    The requested operation could not be found.
${VALUE_DESCRIPTION_REQUESTED_OPERATION_THING_COULDNOTBEFOUND_ERROR}    The requested operation Thing could not be found.
${VALUE_DESCRIPTION_THEOPERATIONHASALREADYEXPIRED_ERROR}    The operation has already expired.
${VALUE_DESCRIPTION_THETHINGIDENTIFIERREQUESTEDALREADYEXISTS_ERROR}    The ThingIdentifier requested already exists.
${VALUE_DESCRIPTION_THETHINGTOKENREQUESTEDALREADYEXISTS_ERROR}    The thingToken requested already exists.
${VALUE_DESCRIPTION_THECLIENTREQUESTMISSINGORINVALIDFORMAT_ERROR}    The client request missing or invalid format
${VALUE_DESCRIPTION_THECLIENTREQUESTMISSINGORINVALIDFORMAT2_ERROR}    The client requested missing or invalid format.
${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}    The requested already exists.
${VALUE_DESCRIPTION_METHODNOTALLOWED_ERROR}    Method not allowed.

${VALUE_DESCRIPTION_CHECKTHINGNAMECOULDNOTBEDUPLICATED_ERROR}    Check ThingName could not be duplicated.
${VALUE_DESCRIPTION_THETHINGNAMECOULDNOTBEDUPLICATED_ERROR}    The ThingName could not be duplicated.
${VALUE_DESCRIPTION_CHECKTHINGSECRETCOULDNOTBEDUPLICATED_ERROR}    Check ThingSecret could not be duplicated.
${VALUE_DESCRIPTION_THETHINGSECRETCOULDNOTBEDUPLICATED_ERROR}    The ThingSecret could not be duplicated.
${VALUE_DESCRIPTION_THEIMEICOULDNOTBEDUPLICATED_ERROR}    The IMEI could not be duplicated.
${VALUE_DESCRIPTION_CHECKIMEICOULDNOTBEDUPLICATED_ERROR}    Check IMEI could not be duplicated.
${VALUE_DESCRIPTION_CHECKTHINGIDENTIFIERCOULDNOTBEDUPLICATED_ERROR}    Check ThingIdentifier could not be duplicated.
${VALUE_DESCRIPTION_THETHINGIDENTIFIERCOULDNOTBEDUPLICATED_ERROR}    The ThingIdentifier could not be duplicated.
${VALUE_DESCRIPTION_THELENGTHOFCHARACTERSISINCORRECT_ERROR}    The length of characters is incorrect.

${VALUE_DESCRIPTION_THINGNAMEISREQUIRED_ERROR}    ThingName is required.
${VALUE_DESCRIPTION_CONNECTIVITYTYPEISREQUIRED_ERROR}    ConnectivityType is required.
${VALUE_DESCRIPTION_THINGIDENTIFIERISREQUIRED_ERROR}    ThingIdentifier is required.
${VALUE_DESCRIPTION_THINGSECRETISREQUIRED_ERROR}    ThingSecret is required.
${VALUE_DESCRIPTION_IMEIISREQUIRED_ERROR}    IMEI is required.

${VALUE_DESCRIPTION_THINGNAMEMUSTBE1AND50YOUENTERD60_ERROR}    ThingName must be between 1 and 50 characters. You entered 60 characters.
${VALUE_DESCRIPTION_THELENGTHOFTHINGIDENTIFIERMUSTBE19CHARACTERSORFEWERYOUENTEREDNUMBERCHARACTERS_ERROR}    The length of ThingIdentifier must be 19 characters or fewer. You entered [num] characters.
${VALUE_DESCRIPTION_THELENGTHOFTHINGIDENTIFIERMUSTBE13CHARACTERSORFEWERYOUENTEREDNUMBERCHARACTERS_ERROR}    The length of ThingIdentifier must be 13 characters or fewer. You entered [num] characters.

${VALUE_DESCRIPTION_THELENGTHOFIMEIMUSTBE20FEWER15YOUENTERD7_ERROR}    The length of IMEI must be 20 characters or fewer 15 characters. You entered 7 characters.
${VALUE_DESCRIPTION_SUPPLIERIDINVALID_ERROR}    
#Role Invalid
${VALUE_DESCRIPTION_ROLEINVALID_ERROR}    Role Invalid


#Witelist

#The client requested missing or invalid  format.
${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    The client requested missing or invalid ${SPACE}format.

${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT2_ERROR}    The client requested missing or invalid  format.
#The ThingIdentifier could not be found.
${VALUE_DESCRIPTION_THETHINGIDENTIFIERCOULDNOTBEFOUND_ERROR}    The ThingIdentifier could not be found.


#The requested operation could not be found.
${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONCOULDNOTBEFOUND_ERROR}    The requested operation could not be found.

#An unknown error has occurred.
${VALUE_DESCRIPTION_ANUNKNOWERRORHASOCCURRED_ERROR}    An unknown error has occurred.

#TThe requested already exists.
${VALUE_DESCRIPTION_THEREQUESTEDALREADYEXISTS_ERROR}    The requested already exists.

#Not Available
${VALUE_DESCRIPTION_NOTAVAILABLE_ERROR}    Not Available

#The length of ThingIdentifier must be 19 characters or fewer. You entered 4 characters.
${VALUE_DESCRIPTION_THELENGTHOFTHINGIDENTIFIERMUSTBE19CHARACTERSORFEWERYOUENTERED4CHARACTERS_ERROR}    The length of ThingIdentifier must be 19 characters or fewer. You entered 4 characters.

#The client requested already exists.
${VALUE_DESCRIPTION_THECLIENTREQUESTEDALREADYEXISTS_ERROR}    The client requested already exists.

#The Thing could not be found.
${VALUE_DESCRIPTION_THETHINGCOULDNOTBEFOUND_ERROR}    The Thing could not be found.

#Thing could not be found.
${VALUE_DESCRIPTION_THINGCOULDNOTFOUND_ERROR}    Thing could not found.

#The length of ThingIdentifier must be 19 characters or fewer. You entered 22 characters.
${VALUE_DESCRIPTION_THINGIDENTIFIEROVERMAX19_ERROR}    The length of ThingIdentifier must be 19 characters or fewer. You entered 25 characters.

#The length of ThingIdentifier must be 13 characters or fewer. You entered 12 characters.
${VALUE_DESCRIPTION_THINGIDENTIFIERLESSTHAN13_ERROR}    The length of ThingIdentifier must be 13 characters or fewer. You entered 12 characters.

#The client requested missing or invalid prefix format.
${VALUE_DESCRIPTION_THINGIDENTIFIER19DIGITPREFIXNOTEQUAL896603_ERROR}    The client requested missing or invalid prefix format.

#The length of ThingSecret must be 20 characters or fewer. You entered 21 characters
${VALUE_DESCRIPTION_THINGSECRETOVERMAX20_ERROR}    The length of ThingSecret must be 20 characters or fewer. You entered 21 characters.

#The length of IMEI must be 20 characters or fewer 15 characters. You entered 22 characters.
${VALUE_DESCRIPTION_IMEIOVERMAX20_ERROR}    The length of IMEI must be 20 characters or fewer 15 characters. You entered 22 characters.

#The length of IMEI must be 20 characters or fewer 15 characters. You entered 14 characters.
${VALUE_DESCRIPTION_IMEILESSTHAN15_ERROR}    The length of IMEI must be 20 characters or fewer 15 characters. You entered 8 characters.

#The length of IMEI must be 20 characters or fewer 15 characters. You entered 4 characters.
${VALUE_DESCRIPTION_IMEITEST_ERROR}    The length of IMEI must be 20 characters or fewer 15 characters. You entered 4 characters.

#The length of ThingIdentifier must be 13 characters or fewer. You entered 4 characters.
${VALUE_DESCRIPTION_THINGIDENTIFIERTEST_ERROR}    The length of ThingIdentifier must be 13 characters or fewer. You entered 4 characters.

#ThingIdentifier is required.
${VALUE_DESCRIPTION_THINGIDENTIFIERISREQUIRED_ERROR}    ThingIdentifier is required.

#ThingSecret is required.
${VALUE_DESCRIPTION_THINGSECRETISREQUIRED_ERROR}    ThingSecret is required.

#IMEI is required.
${VALUE_DESCRIPTION_IMEIISREQUIRED_ERROR}    IMEI is required.

#Check ThingName could not be duplicated.
${VALUE_DESCRIPTION_CHECKTHINGNAMECOULDNOTBEDUPLICATED_ERROR}    Check ThingName could not be duplicated.

#Check ThingSecret could not be duplicated.
${VALUE_DESCRIPTION_CHECKTHINGSECRETCOULDNOTBEDUPLICATED_ERROR}    Check ThingSecret could not be duplicated.

#Check ThingIdentifier could not be duplicated.
${VALUE_DESCRIPTION_CHECKTHINGIDENTIFIERCOULDNOTBEDUPLICATED_ERROR}    Check ThingIdentifier could not be duplicated.

#ThingName must be between 1 and 50 characters. You entered 54 characters.
${VALUE_DESCRIPTION_THINGNAMEOVERMAX50_ERROR}    ThingName must be between 1 and 50 characters. You entered 54 characters.

#The length of ThingIdentifier must be 19 characters or fewer. You entered 14 characters.
${VALUE_DESCRIPTION_THINGIDENTIFIER14DIGIT_ERROR}    The length of ThingIdentifier must be 19 characters or fewer. You entered 14 characters.