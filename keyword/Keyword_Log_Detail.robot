*** Keywords ***	
################################################################-- Have EndPointName --################################################################
#-------------------------------------------- DB --------------------------------------------#	
Check ResponseObject Success DB
    [Arguments]    ${code}    ${description}    ${dataResponse}
	# "{"statusCode":20000,"description":"Success"}"
    # "{"statusCode":[statusCode],"description":"[description]"}""    

	${replaceDescription}    Replace String    ${description}    20000:    ${EMPTY}    
	${replaceCode}=    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_WHITELIST_DB}    [statusCode]    ${code}
	${replaceDescription}=    Replace String    ${replaceCode}    [description]    ${replaceDescription}
	${responseObject}=    Replace String To Object    ${replaceDescription}
	Log To Console    responseObjectDelta${responseObject}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

##############################################################################################################################################################
#-------------------------------------------- Array : ResponseObject --------------------------------------------#	
Check ResponseObject App Success Array	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${cmdName}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${response}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

##############################################################################################################################################################
		
Converting a JSON File
	[Arguments]    ${payload}
    ${MY_DATA_TABLE_VALUES}    evaluate  json.loads('''${payload}''')    json
    [Return]  ${MY_DATA_TABLE_VALUES}

Delta Case1
    [Arguments]    ${payload}
    ${requestObject}=    Convert JSON To String    ${payload}
	[Return]  ${requestObject}