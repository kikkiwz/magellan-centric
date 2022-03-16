*** Keywords ***
####################################################
Log CreateAThing Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${WorkerId}    ${body}
    
    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
	${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection"]
    #${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 
	#${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 

	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
	${responseObjectDetail}=    Set Variable    null
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

    ${resultCode}=    Set Variable If    '${WorkerId}'=='None'    ${VALUE_LOG_CODE_20100}
	...    ${VALUE_LOG_CODE_20100}

    ${resultDescription}=    Set Variable If    '${WorkerId}'=='None'    ${VALUE_DESCRIPTION_CREATEAWORKER_SUCCESS}
	...    ${VALUE_DESCRIPTION_CREATEAWORKER_SUCCESS}

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${resultCode}    ${resultDescription}    ${resultCode}    ${resultDescription}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  


Log CreateAThing Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log UpdateAThing Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${body}
    
    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
	${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection"]
    #${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 
	#${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 

	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
	${responseObjectDetail}=    Set Variable    null
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEATHING_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEATHING_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log UpdateAThing Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log PartailUpdateAThing Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${body}
    
    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
	${endPointName}=    Set Variable    ["db.WorkersCollection","db.WorkersCollection"]
    #${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 
	#${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"20000:InsertWorkers was Success", "processTime":null }]}     	 

	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
	${responseObjectDetail}=    Set Variable    null
	${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_PARTIALUPDATEATHING_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_PARTIALUPDATEATHING_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log PartailUpdateAThing Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log ReturnsAListOfThing Success
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
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THINGRETURNSALISTOFTHING_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THINGRETURNSALISTOFTHING_SUCCESS}  ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}   ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log ReturnsAListOfThing Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log GetAThingByThingId Success
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
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETTHINGBYTHINGID_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETTHINGBYTHINGID_SUCCESS}  ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log GetAThingByThingId Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log DeleteaThing Success
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
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_REMOVEATHING_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_REMOVEATHING_SUCCESS}  ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}   ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log DeleteaThing Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

    #/api/v1/Workers
	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
