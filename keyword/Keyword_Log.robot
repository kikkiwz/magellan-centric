*** Keywords ***	
Post Search Log
    [Arguments]    ${url}    ${valueSearch}    ${value_applicationName}    
	${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    Authorization=${HEADER_AUTHENTICATION}    kbn-version=7.5.1  
    #${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    Host=azmagellancd001-iot.southeastasia.cloudapp.azure.com:30380    kbn-version=7.5.1    Origin=http://azmagellancd001-iot.southeastasia.cloudapp.azure.com:30380    
	# Log To Console    ${headers}
	
	#return valueDateGte,valueDateLte (RANGE_SEARCH 15 minutes)
	${setRange}=    Rang Get Value Minus Time Current Date and Change Format    ${YYYYMMDDTHMSZ_FROM_NOW}    ${RANGE_SEARCH}    ${TIME_STRING_MINUTES}
	#${setRange}=    Rang Get Value Minus Time Current Date and Change Format    ${YYYYMMDDTHMSZ_FROM_NOW}    50    ${TIME_STRING_MINUTES}
	#Log To Console    setRange${setRange}
	${setRangeGTE}=    Set variable    ${setRange}[0]
	${setRangeLTE}=    Set variable    ${setRange}[1]
	#Log To Console    setRangeGTE${setRangeGTE}
	#Log To Console    setRangeLTE${setRangeLTE}

	Log    valueSearch${valueSearch}
	Log To Console    valueSearch${valueSearch}
	
	# best_fields phrase
	${multiMatchType}=    Set Variable    best_fields 
	
    ${data}=    Evaluate    {"version":"true","size":500,"sort":[{"@timestamp_es":{"order":"desc","unmapped_type":"boolean"}}],"_source":{"excludes":[]},"aggs":{"2":{"date_histogram":{"field":"@timestamp_es","fixed_interval":"30s","time_zone":"Asia/Bangkok","min_doc_count":1}}},"stored_fields":["*"],"script_fields":{},"docvalue_fields":[{"field":"@timestamp_es","format":"date_time"},{"field":"cauldron.custom1.activityLog.endTime","format":"date_time"},{"field":"cauldron.custom1.activityLog.startTime","format":"date_time"},{"field":"time","format":"date_time"}],"query":{"bool":{"must":[],"filter":[{"multi_match":{"type":"${multiMatchType}","query":"${valueSearch}","lenient":"true"}},{"range":{"@timestamp_es":{"format":"strict_date_optional_time","gte":"${setRangeGTE}","lte":"${setRangeLTE}"}}}],"should":[],"must_not":[]}},"highlight":{"pre_tags":["@kibana-highlighted-field@"],"post_tags":["@/kibana-highlighted-field@"],"fields":{"*":{}},"fragment_size":2147483647}}
    # Log To Console    ${data}
	# Log To Console    ${url}
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}    ${EMPTY}    ${headers}    ${data}
	Log    ${res}
	${total}=    Set variable    ${res['hits']['total']}
	Log    ${total}
	Should Not Be Equal     ${total}    0
	#Sleep    10s
	[return]    ${res}

#==============================================================================================================================================================================================================================#
Get tid for Search Log
    [Arguments]    ${value_applicationName}    ${valueSearch}    ${endPointName}
	#Log To Console    value_applicationName${value_applicationName}	
	#Log To Console    valueSearch${valueSearch}	
	${resLog}=    Wait Until Keyword Succeeds    3x    10s    Post Search Log    ${URL_GET_LOG}    ${valueSearch}    ${value_applicationName}
	Sleep    10s
	Log    resLog${resLog}	

	${total}=    Set variable    ${resLog['hits']['total']}
	# Log To Console    resLog0${resLog}  
	# Log To Console    total${total}  

	Run Keyword And Return If    '${total}'=='0'    ${resLog}
    Should Not Be Equal     ${total}    0
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${total}
        # Log To Console    ${i}  
	    ${valLog}=    Set variable    ${resLog['hits']['hits'][${i}]['_source']['cauldron']}
        # Log To Console    applicationName${valLog['applicationName']}
        # Log To Console    valLog${valLog}
		
	    ${applicationName}=    Set variable    ${valLog['applicationName']}
        # Log To Console    applicationName${applicationName}
  
		Run Keyword If    '${applicationName}'=='${value_applicationName}'     Append To List    ${valArrData}    ${valLog}        #Add data to array set at valArrData

    # Exit For Loop
	END
	#Log To Console    tivalArrDatad${valArrData}
    ${tid}=    Set variable    ${valArrData[0]['tid']}
	# Log To Console    tid${tid}
	${sessionId}=    Set variable    ${valArrData[0]['sessionId']}
	# Log To Console    sessionId${sessionId}
    [return]    ${tid}    ${sessionId}

#==============================================================================================================================================================================================================================#
Data Log Response
    [Arguments]    ${value_applicationName}    ${valueSearch}    ${endPointName}
	
	Sleep    2s
	${resTid}=    Wait Until Keyword Succeeds    3x    10s    Get tid for Search Log    ${value_applicationName}    ${valueSearch}    ${endPointName}
   
	${resLog}=    Wait Until Keyword Succeeds    3x    10s    Post Search Log    ${URL_GET_LOG}    ${resTid}[0]    ${value_applicationName}
    Log    resLog${resLog}	
	#Sleep    10s
		
	${total}=    Set variable    ${resLog['hits']['total']}
	# Log To Console    total11${total}
	
    @{valArrData}=    Create List
	@{valArrDetail}=    Create List
	@{valArrSummary}=    Create List
	FOR    ${i}    IN RANGE    ${total}
        # Log To Console    ${i}  
	    ${valLog}=    Set variable    ${resLog['hits']['hits'][${i}]['_source']['log']}
        # Log To Console    valLog${valLog}

        # r use for parameter / have in data 
	    ${dataResponse}=    Evaluate    json.loads(r'''${valLog}''')    json
        # Log To Console    dataRespon/se${dataResponse}
	
	    ${applicationName}=    Set variable    ${dataResponse['applicationName']}
        # Log To Console    applicationName${applicationName}
		${logType}=    Set variable    ${dataResponse['logType']}
        # Log To Console    logType${logType}

	    Run Keyword If    '${applicationName}'=='${value_applicationName}'    Append To List    ${valArrData}    ${dataResponse}    #Add data to array set at valArrData
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_DETAIL}'   Append To List    ${valArrDetail}    ${dataResponse}    #Add data to array set at valArrDetail
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_SUMMARY}'   Append To List    ${valArrSummary}    ${dataResponse}    #Add data to array set at valArrSummary
		
    END
	# Log To Console    valArrData${valArrData}  
	Log To Console    valArrDetail${valArrDetail}  
	Log To Console    valArrSummary${valArrSummary}  
    [return]    ${valArrData}    ${valArrDetail}    ${valArrSummary}    ${resTid}[0]    ${resTid}[1]

#==============================================================================================================================================================================================================================#
Check Log Detail 
    [Arguments]    ${code}    ${description}     ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail}   

	${dataLogDetail}=    Run keyword And Continue On Failure    Log Detail Check EndPointName    ${data}
    Log    ${dataLogDetail}    
	#value ArrDetail Have EndPointName
	${valArrDetailHaveEndPointName}=    Set Variable    ${dataLogDetail}[0]
	Log    ${valArrDetailHaveEndPointName}
	#value ArrDetail Not Have EndPointName
	${valArrDetailNotHaveEndPointName}=    Set Variable    ${dataLogDetail}[1]
	Log    ${valArrDetailNotHaveEndPointName}
	# Log To Console    valArrDetailHaveEndPointName${valArrDetailHaveEndPointName}  
	# Log To Console    valArrDetailNotHaveEndPointName${valArrDetailNotHaveEndPointName}  

	${langValArrDetailHaveEndPointName}=    Get Length    ${valArrDetailHaveEndPointName}
    # Log To Console    langValArrDetailHaveEndPointName${langValArrDetailHaveEndPointName}  

	${langValArrDetailNotHaveEndPointName}=    Get Length    ${valArrDetailNotHaveEndPointName}
    # Log To Console    langValArrDetailNotHaveEndPointName${langValArrDetailNotHaveEndPointName}  

	Run Keyword If    '${langValArrDetailHaveEndPointName}'!='0'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
    Run Keyword If    '${langValArrDetailNotHaveEndPointName}'!='0'    Check Log Detail App Do Not Have EndPointName    ${code}    ${description}     ${valArrDetailNotHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${responseObjectDetail} 
	# Run Keyword If    '${code}'!='${VALUE_LOG_CODE_40000}'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
	# Check Log Detail App Do Not Have EndPointName    ${code}    ${description}     ${valArrDetailNotHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${body}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${responseObjectDetail} 
	
	# Run Keyword If    '${code}'!='${VALUE_LOG_CODE_40000}'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
	# Check Log Detail App Do Not Have EndPointName    ${code}    ${description}     ${valArrDetailNotHaveEndPointName}    ${tid}    ${applicationName}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${body}    ${accountId}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

#==============================================================================================================================================================================================================================#
Log Detail Check EndPointName
    [Arguments]    ${data}
	${data_count}=    Get Length    ${data}
	#Log To Console    data_count${data_count}
    @{valArrDetailHaveEndPointName}=    Create List
	@{valArrDetailNotHaveEndPointName}=    Create List
    FOR    ${i}    IN RANGE    ${data_count}
	    ${keyCustom1}=    Set Variable   @{data[${i}]['custom1']}
		# Log To Console    ${keyCustom1}    
		${checkKeyEndPointName}=    Get Matches    ${keyCustom1}    endPointName
		${countKeyEndPointName}=    Get Length    ${checkKeyEndPointName}
		#Log To Console    checkKeyEndPointName${checkKeyEndPointName} 
		#Log To Console    countKeyEndPointName${countKeyEndPointName} 
		Run Keyword If    ${countKeyEndPointName}==1    Append To List    ${valArrDetailHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
		Run Keyword If    ${countKeyEndPointName}==0    Append To List    ${valArrDetailNotHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
		
		#${data[${i}]['custom1']['endPointName']}
	END	
	# Log To Console    valArrDetailHaveEndPointName${valArrDetailHaveEndPointName}  
	# Log To Console    valArrDetailNotHaveEndPointName${valArrDetailNotHaveEndPointName}  
	[return]    ${valArrDetailHaveEndPointName}    ${valArrDetailNotHaveEndPointName}

#==============================================================================================================================================================================================================================#
#-------------------------------------------- Check Log Detail Have EndPointName --------------------------------------------#	

Check Log Detail Have EndPointName  
    [Arguments]    ${code}    ${description}    ${data}    ${tid}    ${applicationName}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
    ${data_count}=    Get Length    ${data}
	# Log To Console    data_count${data_count}  
	# Log To Console    data${data} 
    Log To Console    ${\n}=========== Check Log Detail Have EndPointName ===============
	FOR    ${i}    IN RANGE    ${data_count}
		#Log To Console    ${data[${i}]['custom1']['requestObject']}
		#Log To Console    ${data[${i}]['custom1']['endPointName']}
		#Log To Console    ${code}
	    ${dataResponse}=    Set Variable    ${data[${i}]}
		# Log To Console    dataResponse${dataResponse}  
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}']    ${data[${i}]['systemTimestamp']}    ${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGTYPE}']    ${VALUE_DETAIL}    ${FIELD_LOG_DETAIL_LOGTYPE} 
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGLEVEL}']    ${logLevel}    ${FIELD_LOG_DETAIL_LOGLEVEL} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_NAMESPACE}']    ${namespace}    ${FIELD_LOG_DETAIL_NAMESPACE}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_DETAIL_APPLICATIONNAME}
		#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CONTAINERID}']    ${containerId}    ${FIELD_LOG_DETAIL_CONTAINERID}
        # Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SESSIONID}']    ${tid}    ${FIELD_LOG_DETAIL_SESSIONID}
		Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_TID}']    ${tid}    ${FIELD_LOG_DETAIL_TID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}']    ${data[${i}]['custom1']['activityLog']['startTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}']    ${data[${i}]['custom1']['activityLog']['endTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}']    ${data[${i}]['custom1']['activityLog']['processTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM2}']    ${VALUE_LOG_DETAIL_CUSTOM2}    ${FIELD_LOG_DETAIL_CUSTOM2}
    
		# Run Keyword If    '${data[${i}]['custom1']['endPointName']}'=='${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}' and '${custom}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}    ['endPointName']

		#Check endPointName
		#Check requestObject responseObjects
        ${json_customDetailDB}=    Convert String to JSON    ${customDetailDB}
		Log To Console    json_custom${json_customDetailDB}
		${json_endPointName}=    Convert String to JSON    ${endPointName}
		Log To Console    json_endPointName${json_endPointName}  
		  
		${dataCustomDetailDB}=    Set Variable    ${json_customDetailDB['endPointSummary'][${i}]}
		Log To Console    dataCustomDetailDB${dataCustomDetailDB}  
		${dataEndPointName}=    Set Variable    ${json_endPointName[${i}]}
		Log To Console    dataEndPointName${dataEndPointName}  
		Check Log Detail Custom RequestObject and ResponseObject DB    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${dataEndPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${dataCustomDetailDB}    ${responseObjectDetail} 
																	  
	END

#==============================================================================================================================================================================================================================#
#-------------------------------------------- Check Log Detail : RequestObject and ResponseObject Have EndPointName --------------------------------------------#		
Check Log Detail Custom RequestObject and ResponseObject DB
	[Arguments]    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${dataEndPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${dataCustomDetailDB}    ${responseObjectDetail} 

    # endPointName
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${dataEndPointName}    ['endPointName']
    #RequestObject
    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['requestObject']    ${VALUE_LOG_DETAIL_REQUESTOBJECT_DB}    requestObject    
    #ResponseObject
    Check ResponseObject Success DB    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_SUCCESS}    ${dataResponse}

#==============================================================================================================================================================================================================================#
#-------------------------------------------- Check Log Detail Do Not Have EndPointName --------------------------------------------#		
Check Log Detail App Do Not Have EndPointName
    [Arguments]    ${code}    ${description}     ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${responseObjectDetail} 
    ${data_count}=    Get Length    ${data}
	#Log To Console    data_count${data_count}
    Log To Console    ${\n}=========== Check Log Detail App Do Not Have EndPointName ===============  
	FOR    ${i}    IN RANGE    ${data_count}
	 
	    ${dataResponse}=    Set Variable    ${data[${i}]}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}']    ${data[${i}]['systemTimestamp']}    ${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGTYPE}']    ${VALUE_DETAIL}    ${FIELD_LOG_DETAIL_LOGTYPE}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGLEVEL}']    ${logLevel}    ${FIELD_LOG_DETAIL_LOGLEVEL}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_NAMESPACE}']    ${namespace}    ${FIELD_LOG_DETAIL_NAMESPACE}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_DETAIL_APPLICATIONNAME}
		#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CONTAINERID}']    ${containerId}    ${FIELD_LOG_DETAIL_CONTAINERID}
		## Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SESSIONID}']    ${tid}    ${FIELD_LOG_DETAIL_SESSIONID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_TID}']    ${tid}    ${FIELD_LOG_DETAIL_TID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}']    ${data[${i}]['custom1']['activityLog']['startTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}']    ${data[${i}]['custom1']['activityLog']['endTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}']    ${data[${i}]['custom1']['activityLog']['processTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM2}']    ${VALUE_LOG_DETAIL_CUSTOM2}    ${FIELD_LOG_DETAIL_CUSTOM2}

		Check Log Detail Custom RequestObject and ResponseObject App    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${EndPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${responseObjectDetail}
		                                                               
	END

#==============================================================================================================================================================================================================================#
#-------------------------------------------- Check Log Detail : RequestObject and ResponseObject --------------------------------------------#		
Check Log Detail Custom RequestObject and ResponseObject App
	[Arguments]    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${responseObjectDetail}
    Log To Console    ${\n}=========== Check RequestObject and ResponseObject =============== 
	${GetLength_Des}=    Get Length    ${responseObjectDetail}     
	${removeTextResponseObjectDetail}=    Remove String    ${responseObjectDetail}    '    ${EMPTY}   

	# Log To Console    GetLength_Des:::${GetLength_Des}  
    # Log To Console    pathUrl:::${pathUrl}  

	#==================================================================== Whitelist ==========================================================================================#
    #RequestObject : Create Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}'    Check RequestObject App Success CreateWhitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#ResponseObject : Create Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_40000}' and '${GetLength_Des}'=='4'    Check ResponseObject App Success CreateAWhitelist Error    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    
	#ResponseObject : Create Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_40400}' and '${GetLength_Des}'=='4'    Check ResponseObject App Success CreateAWhitelist Error2      ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    
	#ResponseObject : Create Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_20000}' and '${GetLength_Des}'=='4'    Check ResponseObject App Success CreateAWhitelist    ${code}    ${description}    ${dataResponse}    ${response}    ${body}    ${accessToken}    

	#RequestObject : Update Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}'    Check RequestObject App Success UpdateAWhitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#ResponseObject : Update Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success UpdateAWhitelist    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}    

	#RequestObject : RouteNotFound
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'!='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}' and '${pathUrl}'!='${URL_VERIFIESTHINGS_MISSINGWORKERID}' and '${pathUrl}'!='${URL_IMPORTSLISTOFTHINGBYWORKERID_NOWORKERID}' and '${pathUrl}'!='${URL_EXPORTSLISTOFTHINGBYWORKERID_NOWORKERID}' and '${pathUrl}'!='${URL_ASSIGNTHINGSTOWORKERS_NOWORKERID}' and '${pathUrl}'=='${URL_UPDATETHINGSTOWORKERS_NOWORKERID}' and '${pathUrl}'=='${URL_DELETETHINGSFROMWORKER_NOWORKERID}' and '${pathUrl}'!='${URL_TERMINATESTHINGS_MISSINGWORKERID}'    Check RequestObject App Success RouteNotFound    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#RequestObject : RouteNotFound
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'     Check RequestObject RouteNotFound Get A Whitelist By Thing Identifier    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}

	#RequestObject : Return a list of whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWHITELIST}'    Check RequestObject App Success Return A list Of Whitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}

	#RequestObject : Get A Whitelist By Thing Identifier
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}'    Check RequestObject App Success Get A Whitelist By Thing Identifier    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#ResponseObject : Get A Whitelist By Thing Identifier
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Get A Whitelist By Thing Identifier    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}

	#RequestObject : Delete Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}'    Check RequestObject App Success DeleteAWhitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#RequestObject : Delete Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_20000}' and '${GetLength_Des}'=='4'    Check ResponseObject Success    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    ${code}    ${description}    ${dataResponse}
	
	#==================================================================== VerifiesThings ==========================================================================================#
	#RequestObject : VerifiesThings
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_VERIFIES}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_VERIFIESTHINGS_MISSINGWORKERID}'     Check RequestObject App Success VerifiesThings    ${dataResponse}    ${pathUrl}    ${tid}    ${body}
	#ResponsetObject : VerifiesThings
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_VERIFIES}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}



	#==================================================================== ActivateThings ==========================================================================================#
	#RequestObject : ActivateThings

	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ACTIVATETHINGS}'    Check RequestObject App Success ActivateThings    ${dataResponse}    ${pathUrl}    ${tid}    ${body}

	#ResponsetObject : ActivateThings
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ACTIVATETHINGS}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	

	#==================================================================== TerminatesThings ==========================================================================================#
	#RequestObject : TerminatesThings

	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_TERMINATESTHINGS}'    Check RequestObject App Success TerminatesThings    ${dataResponse}    ${pathUrl}    ${tid}    ${body}

	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_TERMINATESTHINGS_MISSINGWORKERID}'     Check RequestObject App Success TerminatesThings    ${dataResponse}    ${pathUrl}    ${tid}    ${body}

	#ResponsetObject : TerminatesThings
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_TERMINATESTHINGS}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	
#==================================================================== ReturnsAListofThings ==========================================================================================#
	#RequestObject : ReturnsAListofThings
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}'    Check RequestObject App Success ReturnsAListofThings    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${cmdName}
	
	#==================================================================== Worker ==========================================================================================#
	#RequestObject : [CreateAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [UpdateAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [PartialUpdateAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [PartialUpdateAWorker:RouteMethodNotAllowed]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTEMETHODNOTALLOWED}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [ReturnsAListOfWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWORKER}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [GetAWorkerByWorkerId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
    #RequestObject : [DeleteAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [ImportsListOfThingByWorkerId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}' and '${pathUrl}'=='${URL_IMPORTSLISTOFTHINGBYWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [RouteNotFound]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_IMPORTSLISTOFTHINGBYWORKERID_NOWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
    #RequestObject : [ExportsListOfThingsByWorkerId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [ExportsListOfThingsByWorkerId:RouteNotFound]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_EXPORTSLISTOFTHINGBYWORKERID_NOWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [AssignThingsToWorkers]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [AssignThingsToWorkers:RouteNotFound]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_ASSIGNTHINGSTOWORKERS_NOWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [UpdateThingsToWorkers]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [UpdateThingsToWorkers:RouteNotFound]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_UPDATETHINGSTOWORKERS_NOWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [DeleteThingsFromWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [DeleteThingsFromWorker:RouteNotFound]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_DELETETHINGSFROMWORKER_NOWORKERID}'    Check RequestObject App Success Worker    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}

	#ResponseObject : [CreateAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWORKER}' and '${code}'=='${VALUE_LOG_CODE_20100}'    Check ResponseObject App Success Worker    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    #ResponseObject : [UpdateAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWORKER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Worker    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    #ResponseObject : [PartialUpdateAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATEAWORKER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Worker    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	#ResponseObject : [GetAWorkerByWorkerId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWORKERBYWORKERID}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Worker    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    #ResponseObject : [DeleteAWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWORKER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject Success    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    ${code}    ${description}    ${dataResponse}
    #ResponseObject : [ImportsListOfThingByWorkerId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTSLISTOFTHINGBYWORKERID}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    #ResponseObject : [ExportsListOfThingsByWorkerId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_EXPORTSLISTOFTHINGBYWORKERID}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success ExportsListOfThingsByWorkerId    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    #ResponseObject : [AssignThingsToWorkers]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ASSIGNTHINGSTOWORKERS}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    #ResponseObject : [UpdateThingsToWorkers]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGSTOWORKERS}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success UpdateThingsToWorkers    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
    #ResponseObject : [DeleteThingsFromWorker]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETETHINGSFROMWORKER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject Success    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    ${code}    ${description}    ${dataResponse}
 
	#==================================================================== Thing ==========================================================================================#
	#======RequestObject
	#RequestObject : [CreateAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}'    Check RequestObject App Success Thing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [UpdateAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}'    Check RequestObject App Success Thing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [PatialUpdateAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}'    Check RequestObject App Success Thing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [ReturnAListOfThings]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}'   Check RequestObject App Success Thing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [GetThingByThingId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}'    Check RequestObject App Success Thing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [DeleteAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}'    Check RequestObject App Success Thing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}

	#======ResponseObject    						
	#ResponseObject : [CreateAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}' and '${code}'=='${VALUE_LOG_CODE_20000}'     Check ResponseObject App Success Thing    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEATHINGS}' and '${code}'=='${VALUE_LOG_CODE_20100}'     Check ResponseObject App Success Thing    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	#ResponseObject : [UpdateAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATETHINGS}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Thing    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	#ResponseObject : [PatialUpdateAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_PARTIALUPDATETHINGS}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Thing    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	#ResponseObject : [ReturnAListOfThings]
	${checkFillter}=    Remove String    ${pathUrl}    ${URL_THINGRETURNSALISTOFTHING}
	${length}=    Get Length    ${checkFillter}
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}' and '${code}'=='${VALUE_LOG_CODE_20000}' and '${length}'>'0'    Check ResponseObject App Success ThingReturnAListOfThings    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}' and '${code}'=='${VALUE_LOG_CODE_20000}' and '${length}'=='0'    Check ResponseObject App Success ThingReturnAListOfThings Get All    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	#ResponseObject : [GetThingByThingId]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETTHINGBYTHINGID}' and '${code}'=='${VALUE_LOG_CODE_20000}'     Check ResponseObject App Success Thing    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	#ResponseObject : [DeleteAThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_REMOVEATHING}' and '${code}'=='${VALUE_LOG_CODE_20000}'     Check ResponseObject DeleteAThing Success     ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}     ${code}    ${description}    ${dataResponse}
		
            

#==================================================================== ImportThing ==========================================================================================#
	#RequestObject : ImportThing

	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHING}' and '${pathUrl}'=='${URL_IMPORTTHING}'    Check RequestObject App Success ImportThing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}

	#ResponsetObject : ImportThing
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHING}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHING}' and '${code}'=='${VALUE_LOG_CODE_20100}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}


#==================================================================== ImportThingBySupplierID ==========================================================================================#
	#RequestObject : ImportThingBySupplierID

	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}'    Check RequestObject App Success ImportThingBySupplierID   ${dataResponse}    ${pathUrl}    ${tid}    ${body}

	#ResponsetObject : ImportThingBySupplierID
	#Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}' and '${code}'=='${VALUE_LOG_CODE_20100}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	


#==================================================================== MappingIMEI ==========================================================================================#
	#RequestObject : MappingIMEI

	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_MAPPINGIMEI}'    Check RequestObject App Success MappingIMEI    ${dataResponse}    ${pathUrl}    ${tid}    ${body}

	#ResponsetObject : MappingIMEI
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_MAPPINGIMEI}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_MAPPINGIMEI}' and '${code}'=='${VALUE_LOG_CODE_20100}'    Check ResponseObject App Success Array    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}
	
#==================================================================== DeleteRawThing ==========================================================================================#

	#RequestObject : [DeleteRawThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETERAWTHING}'    Check RequestObject App Success DeleteRawThing    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    
	
	#ResponseObject : [DeleteRawThing]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETERAWTHING}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject Success    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    ${code}    ${description}    ${dataResponse}

    #-------------------------------------------- Error --------------------------------------------#   
	#ResponseObject : [Error !20000]
    Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${removeTextResponseObjectDetail}'=='null' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}'    Check ResponseObject Error    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}
    Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${code}'!='${VALUE_LOG_CODE_40400}' and '${code}'!='${VALUE_LOG_CODE_40000}' and '${code}'!='${VALUE_LOG_CODE_40301}' and '${removeTextResponseObjectDetail}'!='null' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFTHINGS}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}' and '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}

	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CENTRIC_THING_NOTFOUND}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
    #Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${removeTextResponseObjectDetail}'!='null' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_IMPORTTHINGBYSUPPLIER}'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR1}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	
	
	#Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${code}'!='${VALUE_LOG_CODE_40400}' and '${code}'!='${VALUE_LOG_CODE_40000}' and '${removeTextResponseObjectDetail}'!='null'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	Run Keyword If    '${code}'=='${VALUE_LOG_CODE_40400}' and '${code}'=='${VALUE_LOG_CODE_40000}' and '${code}'=='${VALUE_LOG_CODE_40301}' and '${removeTextResponseObjectDetail}'!='null'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR1}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	
#==============================================================================================================================================================================================================================#
#--------------------------------------------  ResponseObject Success Have Code and Description --------------------------------------------#
Check ResponseObject Success
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}
	
	# ${code}=    Set Variable    ${code}

	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [DeveloperMessage]    ${description}

	${responseObject}=    Replace String To Object    ${replaceDescriptionCmdName}
	# Log To Console    responseObjectError${responseObject}
			
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


#--------------------------------------------  ResponseObject Error Not Have EndPointName --------------------------------------------#
Check ResponseObject Error  
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

#==============================================================================================================================================================================================================================#
Check ResponseObject Error Detail  
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	Log To Console    ResponseObject Error Detail 
    Log To Console    ${\n}==ResponseObject Error Detail==	
	# ${code}=    Set Variable    ${code}
	# ${code} =	Set Variable If    '${code}'=='${VALUE_LOG_CODE_40300}'    ${VALUE_LOG_CODE_40400}
	# ...    '${code}'!='${VALUE_LOG_CODE_40300}'    ${code}
	# Log To Console    code${code}
	# Log To Console    description${description}

    Log    responseObjectDetail ${responseObjectDetail}
    Log    dataResponse ${dataResponse}
	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [DeveloperMessage]    ${description}
	${replaceDetail}=    Replace String    ${replaceDescriptionCmdName}    [Detail]    ${responseObjectDetail}
	${responseObject}=    Set Variable    ${replaceDetail}
	# Log To Console    responseObjectError${responseObject}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


#==============================================================================================================================================================================================================================#
Check Log Response 
    #resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName,pathUrl,dataSearch,accessToken,accountId,body[request],response[response],namespace,containerId,identity,cmdName,endPointName,logLevel,custom,customDetailDB,responseObjectDetail
    [Arguments]    ${resultCode_summary}    ${resultDesc_summary}    ${code_detail}    ${description_detail}    ${applicationName}    ${pathUrl}     ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${endPointName}    ${logLevel}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


	${dataLogResponse}=    Data Log Response    ${applicationName}    ${dataSearch}    ${endPointName}
	Log    Log is :${dataLogResponse}
	
	Check Log Detail    ${code_detail}    ${description_detail}    ${dataLogResponse}[1]    ${dataLogResponse}[3]    ${applicationName}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
    Check Log Summary    ${resultCode_summary}    ${resultDesc_summary}    ${dataLogResponse}[2]    ${dataLogResponse}[3]    ${applicationName}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${custom}

#==============================================================================================================================================================================================================================#
Replace String To Object
    [Arguments]    ${string}
    
	${replStringToJsonStart}=    Replace String    ${string}    "{    {
	${replStringToJsonEnd}=    Replace String    ${replStringToJsonStart}    }"    }
	[RETURN]    ${replStringToJsonEnd}
	