*** Keywords ***
####################################################

#==========================================================================VerifiesThings====================================================================================================================================================================================================#

Log VerifiesThings Array
    [Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null


	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_VERIFIESTHINGS_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_VERIFIES}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

                                     

Log VerifiesThings Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	${cmdName}=    Set Variable If    '${pathUrl}'=='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    ${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}
	...    '${pathUrl}'!='${URL_VERIFIESTHINGS_MISSINGWORKERID}'    ${VALUE_LOG_SUMMARY_CMDNAME_VERIFIES}    
	
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 



#==========================================================================TerminatesThings====================================================================================================================================================================================================#

Log TerminatesThings Array
    [Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_TERMINATESTHINGS_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_TERMINATESTHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 




Log TerminatesThings Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	${cmdName}=    Set Variable If    '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}
	...    '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    ${VALUE_LOG_SUMMARY_CMDNAME_TERMINATESTHINGS} 

    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


#==========================================================================ActivateThings====================================================================================================================================================================================================#

Log ActivateThings Array
    [Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_ACTIVATETHINGS_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_ACTIVATETHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 




Log ActivateThings Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_ACTIVATETHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


#==========================================================================ReturnsAListofThings====================================================================================================================================================================================================#

Log ReturnsAListofThings Array
    [Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_RETURNSALISTOFTHINGS_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


Log ReturnsAListofThings Success
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null                                  	 
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null

	# ${endPointName}=    Set Variable    ["db.WorkersCollection","db.ThingsCollection"]
    # ${custom}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"200:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"200:InquiryThing was Success", "processTime":null }]}     	 
	# ${customDetailDB}=    Set Variable    { "endPointSummary":[ { "no":"1", "endPointName":"db.WorkersCollection", "endPointURL":null, "responseStatus":"200:InquiryWorkers was Success", "processTime":null }, { "no":"2", "endPointName":"db.ThingsCollection", "endPointURL":null, "responseStatus":"200:InquiryThing was Success", "processTime":null }]}
    # ${responseObjectDetail}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_RETURNSALISTOFTHINGS_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_RETURNSALISTOFTHINGS_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
                          


Log ReturnsAListofThings Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}     

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	${body}=    Set Variable    null

    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
