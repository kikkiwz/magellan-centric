*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
ExportsListOfThingsByWorkerId_TST_F21_0_4_000_Error_WorkerIdTest
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Imports list of Thing by WorkerId
	...    3.Exports  list of Things by WorkerId	
	...    4.Delete a Thing	
	...    5.Delete a Worker

	#====== Start Prepare data ==========

    #urlExportsListOfThingsByWorkerId
	${urlExportsListOfThingsByWorkerId}=    Replace String    ${URL_EXPORTSLISTOFTHINGBYWORKERID}    WorkerId    ${VALUE_CENTRIC_EXPORTSLISTOFTHINGBYWORKERID_WORKERID_INVALID}
    Log To Console    urlExportsListOfThingsByWorkerId is : ${urlExportsListOfThingsByWorkerId}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_EXPORTSLISTOFTHINGBYWORKERID}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	#Body
    ${body}=    Evaluate    {}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${urlExportsListOfThingsByWorkerId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${EXPORTSLISTOFTHINGBYWORKERID}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    #====== Start Prepare data : Check log ==========

    ${pathUrl}=    Set Variable    ${urlExportsListOfThingsByWorkerId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    [{"Target":"WorkerId","DeveloperMessage":"'WorkerId' is not Object Id."}]
	${cmdName}=    Set Variable    ${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}

	#====== End Prepare data : Check log ==========

    #====== Check log ==========

	#Check log detail and summary
    Log ExportsListOfThingsByWorkerId Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${cmdName}
