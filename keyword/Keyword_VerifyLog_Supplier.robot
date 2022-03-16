*** Keywords ***
####################################################

Log ImportThing Array
    [Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_20100}    ${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHING}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


Log ImportThing Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHING} 

    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


Log ImportThingBySupplierId Array
    [Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${accessToken}=    Set Variable    null 
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_20100}    ${VALUE_DESCRIPTION_IMPORTTHINGBYSUPPLIER_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


Log ImportThingBySupplierId Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER} 
  
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 






Log MappingIMEI Array
    [Arguments]    ${response}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body}

	${identity}=    Set Variable    ${EMPTY}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_MAPPINGIMEI}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log MappingIMEI Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${body} 

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null

	${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_MAPPINGIMEI} 

    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


Log DeleteRawThing Success
    [Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    

	${identity}=    Set Variable    ${EMPTY}
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null     	 
	${customDetailDB}=    Set Variable    null                   	 
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null
	${body}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETERAWTHING_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETERAWTHING_SUCCESS}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${ACESSTOKEN_NULL}    ${ACCOUNTID_NULL}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETERAWTHING}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log DeleteRawThing Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

	${identity}=    Set Variable    ${EMPTY}
    ${response}=    Set Variable    ${getData}
	${accessToken}=    Set Variable    null
	${accountId}=    Set Variable    null
	${body}=    Set Variable    null

	${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_DELETERAWTHING}

	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_CENTRIC}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_CENTRIC}    ${identity}    ${cmdName}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
