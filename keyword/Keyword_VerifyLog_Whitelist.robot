*** Keywords ***
####################################################

Log CreateAWhitelist Success
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${OwnerId}    ${OwnerType}    ${ThingIdentifier}

	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null
     
	# ${endPointName}=    Set Variable    ["db.WhitelistDeviceCollection","db.WhitelistDeviceCollection","db.ThingsCollection","db.WhitelistDeviceCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"200:InquiryThing was Success", "processTime":null }, { "no":"3", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"4", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InsertWhitelist was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"3", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"200:InquiryThing was Success", "processTime":null }, { "no":"4", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InsertWhitelist was Success", "processTime":null }]}
                                              	 
	${body}=    Set Variable    [{"OwnerType":"${OwnerType}","OwnerId":"${OwnerId}","ThingIdentifier":["${ThingIdentifier}"]}]
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null
	# ${dataSearch}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_CREATEAWHITELIST_SUCCESS1}    ${VALUE_LOG_CODE_20100}    ${VALUE_DESCRIPTION_CREATEAWHITELIST_SUCCESS1}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

                          

Log CreateAWhitelist Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}          
	${response}=    Set Variable    ${getData}

    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  



#==============================================================================================================================================================================================================================================================================#



Log UpdateAWhitelist Success
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${ThingIdentifier}

	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null


	# ${endPointName}=    Set Variable    ["db.WhitelistDeviceCollection","db.WhitelistDeviceCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:UpdateWhitelist was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:UpdateWhitelist was Success", "processTime":null }]}
                                              	 
	${body}=    Set Variable    {"ThingIdentifier":["${ThingIdentifier}"]}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null
	# ${dataSearch}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEAWHITELIST_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEAWHITELIST_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
                          

Log UpdateAWhitelist Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}          
	${response}=    Set Variable    ${getData}
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  


Log UpdateAWhitelist RouteNotFound Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}          
	${response}=    Set Variable    ${getData}
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  


#==============================================================================================================================================================================================================================================================================#

Log Return a list of Whitelist Success
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${AccountId}    ${OwnerType_Customer}    ${CustomerId}    ${ThingIdentifier}

	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null


	# ${endPointName}=    Set Variable    ["db.WhitelistDeviceCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }]}
                                              	 
	${body}=    Set Variable    {}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null
	# ${dataSearch}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_RETURNSALISTOFWHITELIST_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_RETURNSALISTOFWHITELIST_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
                          

#==============================================================================================================================================================================================================================================================================#


Log Get A Whitelist By Thing Identifier Success
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${AccountId}    ${ThingIdentifier}

	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null


	# ${endPointName}=    Set Variable    ["db.WhitelistDeviceCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }]}
                                              	 
	${body}=    Set Variable    {}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null
	# ${dataSearch}=    Set Variable    null


    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETAWHITELISTBYTHINGIDENTIFIER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETAWHITELISTBYTHINGIDENTIFIER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
             

Log Get A Whitelist By Thing Identifier Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}          
	${response}=    Set Variable    ${getData}
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  


Log Get A Whitelist By Thing Identifier RouteNotFound Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}          
	${response}=    Set Variable    ${getData}
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  


#==============================================================================================================================================================================================================================================================================#


Log DeleteAWhitelist Success
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${ThingIdentifier}    ${body}

	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null


	# ${endPointName}=    Set Variable    ["db.WhitelistDeviceCollection","db.WhitelistDeviceCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:UpdateWhitelist was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:UpdateWhitelist was Success", "processTime":null }]}
                                              	 
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null
	# ${dataSearch}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAWHITELIST_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAWHITELIST_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


Log DeleteAWhitelist Success NotSendThingidentifier
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${ThingIdentifier}    ${body}

	${identity}=    Set Variable    ${EMPTY}

	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null


	# ${endPointName}=    Set Variable    ["db.WhitelistDeviceCollection","db.WhitelistDeviceCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:DeleteWhitelist was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:InquiryWhitelist was Success", "processTime":null }, { "no":"2", "endPointName":"db.WhitelistDeviceCollection", "endPointURL":null, "responseStatus":"200:DeleteWhitelist was Success", "processTime":null }]}
                                              	 
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null
	# ${dataSearch}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAWHITELIST_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAWHITELIST_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
                          

Log DeleteAWhitelist Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}          
	${response}=    Set Variable    ${getData}
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  


Log DeleteAWhitelist RouteNotFound Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${accountId}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}          
	${response}=    Set Variable    ${getData}
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  



#==============================================================================================================================================================================================================================================================================#