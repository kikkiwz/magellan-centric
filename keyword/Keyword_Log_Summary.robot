*** Keywords ***	
#-------------------------------------------- Check Log Summary --------------------------------------------#		
Check Log Summary
    [Arguments]    ${resultCode}    ${resultDesc}    ${data}    ${tid}    ${applicationName}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${custom}
	#Log To Console    data${data}
    Log To Console    ${\n}=========== Check Log Summary ===============
	${dataResponse}=    Set Variable    ${data[0]} 
    Log    ${dataResponse}

	${cmd}=    Set Variable If    '${resultCode}'=='${VALUE_LOG_CODE_40500}'    ${VALUE_LOG_SUMMARY_CMDNAME_REOUTMETHODNOTALLOWED}
    ...   '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS}'    ${VALUE_LOG_SUMMARY_CMDNAME_THINGRETURNSALISTOFTHINGS_Final}
	...    ${cmdName} 

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}']    ${data[0]['systemTimestamp']}    ${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_LOGTYPE}']    ${VALUE_SUMMARY}    ${FIELD_LOG_SUMMARY_LOGTYPE}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_NAMESPACE}']    ${namespace}    ${FIELD_LOG_SUMMARY_NAMESPACE}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_SUMMARY_APPLICATIONNAME}
	#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CONTAINERID}']    ${containerId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_SESSIONID}']    ${data[0]['sessionId']}    ${FIELD_LOG_SUMMARY_SESSIONID}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_TID}']    ${data[0]['tid']}    ${FIELD_LOG_SUMMARY_TID}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_IDENTITY}']    ${identity}    ${FIELD_LOG_SUMMARY_IDENTITY}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CMDNAME}']    ${cmd}    ${FIELD_LOG_SUMMARY_CMDNAME} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_RESULTCODE}']    ${resultCode}    ${FIELD_LOG_SUMMARY_RESULTCODE} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_RESULTDESC}']    ${resultDesc}    ${FIELD_LOG_SUMMARY_RESULTDESC}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_REQTIMESTAP}']    ${data[0]['reqTimestamp']}    ${FIELD_LOG_SUMMARY_REQTIMESTAP} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_RESTIMESTAMP}']    ${data[0]['resTimestamp']}    ${FIELD_LOG_SUMMARY_RESTIMESTAMP}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_USAGETIME}']    ${data[0]['usageTime']}    ${FIELD_LOG_SUMMARY_USAGETIME} 
	
	# Log To Console    custom${custom}
    # Log To Console    dataResponse${dataResponse}
	
	#Check endPointSummary
	Run Keyword If    '${custom}'!='null'    Check endPointSummary    ${custom}    ${dataResponse}
	Run Keyword If    '${custom}'=='null'    Check Custom     ${VALUE_LOG_SUMMARY_CUSTOM}   ${dataResponse}

Check endPointSummary	
    [Arguments]    ${custom}    ${dataResponse}  
	# Log To Console    custom${custom}
	${json_custom}=    Convert String to JSON    ${custom}
	# Log To Console    json_custom${json_custom}
	${endPointSummary}=    Set Variable    ${json_custom['endPointSummary']}
	Log    ${endPointSummary}
	# Log To Console    endPointSummary${endPointSummary}
	#ดึงค่า processTime จาก response ที่ได้
	${data_count}=    Get Length    ${dataResponse['${FIELD_LOG_SUMMARY_CUSTOM}']['${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}']} 
    # Log To Console    data_count${data_count}
	FOR    ${i}    IN RANGE    ${data_count} 
	    ${dataResponse_processTime_value}=    Set Variable     ${dataResponse['${FIELD_LOG_SUMMARY_CUSTOM}']['${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}'][${i}]['processTime']}     
	    ${endPointSummary_update_step}=    Update Value To Json    ${json_custom['${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}'][${i}]}    processTime    ${dataResponse_processTime_value}
	    Log    ${endPointSummary_update_step}
        # Log To Console    endPointSummary_update_step${endPointSummary_update_step}

		# check endPointSummary
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CUSTOM}']['${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}'][${i}]     ${endPointSummary_update_step}    ${FIELD_LOG_SUMMARY_CUSTOM}.${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY} 
	END
	
Check customData
    [Arguments]    ${custom}    ${dataResponse}  
	${json_custom}=    Convert String to JSON    ${custom}

	${customdata}=    Set Variable    ${json_custom['customData']}
	Log    ${customdata}
	# Log To Console    customdata${customdata}
	#check customdata
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CUSTOM}']['${FIELD_LOG_SUMMARY_CUSTOMDATA}']     ${customdata}    ${FIELD_LOG_SUMMARY_CUSTOM}.${FIELD_LOG_SUMMARY_CUSTOMDATA} 

Check Custom
    [Arguments]    ${custom}    ${dataResponse}  
    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CUSTOM}']     ${custom}    ${FIELD_LOG_SUMMARY_CUSTOM}
	