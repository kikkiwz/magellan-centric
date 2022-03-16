*** Keywords ***
####################################################
Log CreateAWorker Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${WorkerName}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    
    
    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    null

	${body}=    Set Variable    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20100}    ${VALUE_DESCRIPTION_CREATEAWORKER_SUCCESS}    ${VALUE_LOG_CODE_20100}    ${VALUE_DESCRIPTION_CREATEAWORKER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log CreateAWorker Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log UpdateAWorker Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${WorkerName}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${WorkerId}    
    
    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection","db.WorkersCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"3", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:UpdateWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"3", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:UpdateWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    null

	${body}=    Set Variable    {"WorkerId":"${WorkerId}","WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEAWORKER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEAWORKER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log UpdateAWorker Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log PartialUpdateAWorker Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${checkLog}    ${op}    ${path}    ${value}
    
    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
	
	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection","db.WorkersCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"3", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:UpdateWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"3", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:UpdateWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    null

	${body}=    Set Variable If    '${op}'!='null'    [{"op":"${op}","path":"${path}","value":"${value}"}]
	...    '${op}'=='null'    [{"path":"${path}","value":"${value}"}]

	${response}=    Set Variable    ${checkLog}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_PARTIALUPDATEAWORKER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_PARTIALUPDATEAWORKER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log PartialUpdateAWorker Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${cmdName}    ${body} 

    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log GetAWorkerByWorkerId Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${WorkerName}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${WorkerId}    
    
    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    null

	${body}=    Set Variable    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETAWORKERBYWORKERID_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETAWORKERBYWORKERID_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log GetAWorkerByWorkerId Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	${body}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log ReturnsAListOfWorker Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${body}
    
    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
	
	# ${endPointName}=    Set Variable    ["db.WorkersCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    null

	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_RETURNSALISTOFWORKER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_RETURNSALISTOFWORKER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log DeleteAWorker Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${WorkerName}    ${ServerIP}    ${ServerPort}    ${ServerDomain}    ${WorkerState}    ${WorkerId}    
    
    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:UpdateWorkers was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:UpdateWorkers was Success", "processTime":null }]}     	 
	${responseObjectDetail}=    Set Variable    null

	${body}=    Set Variable    {"WorkerName":"${WorkerName}","ServerProperties":{"ServerIP":"${ServerIP}","ServerPort":"${ServerPort}","ServerDomain":"${ServerDomain}"},"WorkerState":"${WorkerState}"}
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAWORKER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAWORKER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log DeleteAWorker Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

    #/api/v1/Workers/
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	${body}=    Set Variable    null

	${cmdName}=    Set Variable If    '${Code}'=='${VALUE_LOG_CODE_40500}'    ${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}
	...    '${Code}'!=${VALUE_LOG_CODE_40500}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log ImportsListOfThingByWorkerId Success Array
	[Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 
    
    #/api/v1/Workers/WorkerId/Import/Things
	${identity}=    Set Variable    ${EMPTY}
	
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log ImportsListOfThingByWorkerId Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}    ${cmdName} 

    #/api/v1/Workers/WorkerId/Import/Things
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log ExportsListOfThingsByWorkerId Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}   
    
    #/api/v1/Workers/WorkerId/Export/Things
	${identity}=    Set Variable    ${EMPTY}
	
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.ThingsCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:InquiryThing was Success"}]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"20000:InquiryThing was Success"}]}     	 
	${responseObjectDetail}=    Set Variable    null

	${body}=    Set Variable    {}
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_EXPORTSLISTOFTHINGBYWORKERID_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_EXPORTSLISTOFTHINGBYWORKERID_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log ExportsListOfThingsByWorkerId Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${cmdName} 

    #/api/v1/Workers/WorkerId/Export/Things
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	${body}=    Set Variable    {}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log AssignThingsToWorkers Success Array
	[Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 
    
    #/api/v1/Workers/WorkerId/Thing/Assign
	${identity}=    Set Variable    ${EMPTY}
	
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log AssignThingsToWorkers Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}    ${cmdName} 

    #/api/v1/Workers/WorkerId/Thing/Assign
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    ${ASSIGNTHINGSTOWORKERS}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log UpdateThingsToWorkers Success
	[Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 
    
    #/api/v1/Workers/WorkerId/Thing/Assign
	${identity}=    Set Variable    ${EMPTY}
	
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATETHINGSTOWORKERS_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATETHINGSTOWORKERS_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log UpdateThingsToWorkers Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}    ${cmdName} 

    #/api/v1/Workers/WorkerId/Thing/Assign
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    ${UPDATETHINGSTOWORKERS}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log DeleteThingsFromWorker Success
	[Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 
    
    #/api/v1/Workers/WorkerId/Thing/Assign
	${identity}=    Set Variable    ${EMPTY}
	
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETETHINGSFROMWORKER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETETHINGSFROMWORKER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log DeleteThingsFromWorker Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}    ${cmdName} 

    #/api/v1/Workers/WorkerId/Thing/Assign
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    ${DELETETHINGSFROMWORKER}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
