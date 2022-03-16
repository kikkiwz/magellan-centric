*** Settings ***
Library    RequestsLibrary
#Library    HttpLibrary.HTTP

#Library Document
#http://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html


*** Keywords ***
#Get
Get Api Request
    [Arguments]    ${url}    ${pathUrl}    ${headers}
    Create Session    ${NAME_SESSION_GET}     ${url}    verify=false    disable_warnings=1
    Log To Console    ${url}${pathUrl} 
    Log    URL${\n}${url}${pathUrl}
    Log    HEADER${\n}${headers}

    ${res}=    GET On Session    ${NAME_SESSION_GET}     ${pathUrl}     expected_status=anything    headers=${headers}
    Log    RESPONSE${\n}${res.json()}
    [return]    ${res.json()}
	
#Post
Post Api Request
    [Arguments]    ${url}    ${pathUrl}    ${headers}   ${data}
    Create Session    ${NAME_SESSION_POST}    ${url}    verify=false    disable_warnings=1
    Log To Console    ${url}${pathUrl} 
    Log    URL${\n}${url}${pathUrl}
    Log    HEADER${\n}${headers}
    Log    BODY${\n}${data} 
    
    ${res}=    POST On Session    ${NAME_SESSION_POST}    ${pathUrl}     expected_status=anything    headers=${headers}    json=${data} 
    Log To Console    POST${res}   
    # Log To Console    ${res.Content}
	Log    RESPONSE${\n}${res.json()}
	# Log To Console    ${res.text}
	[return]    ${res.json()} 
	
#Put
Put Api Request
    [Arguments]    ${url}    ${pathUrl}   ${headers}    ${data}
    Create Session    ${NAME_SESSION_PUT}    ${url}    verify=true    #for https
    Log    URL${\n}${url}${pathUrl}
    Log    HEADER${\n}${headers}
    Log    BODY${\n}${data} 
    ${res}=  PUT On Session    ${NAME_SESSION_PUT}    ${pathUrl}    expected_status=anything    json=${data}    headers=${headers}
	Log    RESPONSE${\n}${res.json()}
    [return]    ${res.json()}
	
#Delete	
Delete Api Request
    [Arguments]    ${url}    ${pathUrl}    ${headers}   ${data}
    Create Session    ${NAME_SESSION_DELETE}    ${url}    verify=true    #for https
    Log To Console    ${url}${pathUrl} 
    Log    URL${\n}${url}${pathUrl}
    Log    HEADER${\n}${headers}
    Log    BODY${\n}${data} 
    ${res}=    DELETE On Session    ${NAME_SESSION_DELETE}    ${pathUrl}    expected_status=anything    json=${data}    headers=${headers}
	# ${res}=    DELETE On Session    ${NAME_SESSION_DELETE}    ${pathUrl}    expected_status=anything    headers=${headers}
	
    ${res_json}=    Set Variable
    Log    RESPONSE${\n}${res.json()}
    #Log To Console    ${res.json()}
	[return]    ${res.json()}

Patch Api Request
    [Arguments]    ${url}    ${pathUrl}   ${headers}    ${data}
    Create Session    ${NAME_SESSION_PUT}    ${url}    verify=true    #for https
    Log    URL${\n}${url}${pathUrl}
    Log    HEADER${\n}${headers}
    Log    BODY${\n}${data} 
    ${res}=  PATCH On Session    ${NAME_SESSION_PUT}    ${pathUrl}    expected_status=anything    json=${data}    headers=${headers}
	Log    RESPONSE${\n}${res.json()}
    [return]    ${res.json()}


#Delete	Not Data
Delete Api Request Not Data
    [Arguments]    ${url}    ${pathUrl}    ${headers}
    Create Session    ${NAME_SESSION_DELETE}    ${url}    verify=true    #for https
    Log To Console    ${url}${pathUrl} 
    Log    URL${\n}${url}${pathUrl}
    Log    HEADER${\n}${headers}

	${res}=    DELETE On Session    ${NAME_SESSION_DELETE}    ${pathUrl}    expected_status=anything    headers=${headers}
	
    ${res_json}=    Set Variable
    Log    RESPONSE${\n}${res.json()}
    #Log To Console    ${res.json()}
	[return]    ${res.json()}    

#Should Have Response Status Code = 200
Response Status Code Should Have Success
    [Arguments]    ${res}
	Should Be Equal As Integers    ${res.status_code}  ${STATUS_CODE_SUCCESS}

#Should Have Response Status Code = 201
Response Status Code Should Have Success Create
    [Arguments]    ${res}
	Should Be Equal As Integers    ${res.status_code}  ${STATUS_CODE_CREATE}

#Check Response ResultCode 
Response ResultCode Should Have
    [Arguments]    ${res_json}    ${res_name}    ${field_OperationStatus}    ${field_Code}    ${field_Description}  

    # Log To Console    1111:${res_json}
    # Log To Console    res_name:${res_name}
    # Log To Console    3333:${field_OperationStatus}
    # Log To Console    field_Code:${field_Code} 
    # Log To Console    field_Description:${field_Description}

	${operationStatus}=    Get From Dictionary    ${res_json}     ${field_OperationStatus}    #OperationStatus
	${resultCode}=    Get From Dictionary    ${operationStatus}     ${field_Code}    #Code

    ${field_Description_Developermassage}=    Set Variable If    '${res_name}'!='${CREATEATHINGHAVEWORKER}' or '${res_name}'!='${CREATEATHINGNOTHAVEWORKER}'    ${field_Description}
    ...    '${res_name}'!='${CREATEAWORKER}'    ${FIELD_DEVELOPERMESSAGE}
    ...    '${res_name}'=='${CREATEATHINGHAVEWORKER}'    ${FIELD_DEVELOPERMESSAGE}
    ...    '${res_name}'=='${CREATEATHINGNOTHAVEWORKER}'    ${FIELD_DEVELOPERMESSAGE}
    ...    '${res_name}'=='${CREATEAWORKER}'    ${FIELD_DEVELOPERMESSAGE}
    ...    '${res_name}'=='${RETURNSALISTOFWHITELIST}'    ${FIELD_DEVELOPERMESSAGE}
    # ...    '${res_name}'=='${CREATEAWHITELIST}'    ${FIELD_STATUSDESCRIPTION}
	${resultDescription}=    Get From Dictionary    ${operationStatus}     ${field_Description_Developermassage}        #Description


	#Log To Console    ${operationStatus}
	#Log To Console    ${resultCode}
	Log To Console    resultDescription:${resultDescription}
	#Log To Console    ${VALUE_RESULTCODE_20000}
	${ResponseResultCodeShouldHaveSuccess}=    run keyword If    ${resultCode} == ${VALUE_RESULTCODE_20000}    Response ResultCode Should Have Success    ${resultCode}    ${resultDescription}    ${res_name}
    #...    FAIL    msg=${resultCode}${resultDescription}
	...    ELSE IF    ${resultCode} == ${VALUE_RESULTCODE_20100}    Response ResultCode Should Have Success    ${resultCode}    ${resultDescription}    ${res_name}
	#...    FAIL    msg=${resultCode}${resultDescription}
	...    ELSE IF    ${resultCode} != ${VALUE_RESULTCODE_20000} and ${resultCode} != ${VALUE_RESULTCODE_20100}    Fail    msg=${res_name} Error :[${resultCode}:${resultDescription}]
	#run keyword If    ${resultCode} == ${EMPTY}    Fail    msg=!!API "${res_name}" Failed!!
	#run keyword If    ${resultCode} != ${VALUE_RESULTCODE_20000} and ${resultCode} != ${VALUE_RESULTCODE_20100}    Fail    msg=[${resultCode}:${resultDescription}]
	#run keyword If    ${resultCode} != ${VALUE_RESULTCODE_20100}    Fail    msg=${resultCode}${resultDescription}	
    ...    ELSE IF    ${resultCode} == ${VALUE_RESULTCODE_20000} or ${resultCode} == ${VALUE_RESULTCODE_20100}    Log    ${res_name} Succeeds :[${resultCode}:${resultDescription}]
    # ...    ELSE IF    ${resultCode} == ${VALUE_RESULTCODE_20100} and     Response ResultCode Should Have Success    ${resultCode}    ${resultDescription}    ${res_name}
    Log To Console    ResponseResultCodeShouldHaveSuccess${ResponseResultCodeShouldHaveSuccess}
    [Return]    ${ResponseResultCodeShouldHaveSuccess}


Response ResultCode Should Have Success
    [Arguments]    ${resultCode}    ${resultDescription}    ${res_name}    

    ${shouldBeEqualResultCode}=    Run Keyword If    "${resultCode}" == "${VALUE_RESULTCODE_20000}"    Should Be Equal As Strings    ${resultCode}    ${VALUE_RESULTCODE_20000}
    ...    ELSE IF    ${resultCode} == "${VALUE_RESULTCODE_20100}"    Should Be Equal As Strings    ${resultCode}    ${VALUE_RESULTCODE_20100}
    # ...    ELSE IF    ${resultCode} != "${VALUE_RESULTCODE_20000}"    Should Be Equal As Strings    ${resultCode}    ${VALUE_RESULTCODE_20100}
    # ...    ELSE IF    ${resultCode} != "${VALUE_RESULTCODE_20100}"    Should Be Equal As Strings    ${resultCode}    ${VALUE_RESULTCODE_20100}
    
    # Log To Console    shouldBeEqualResultCode${shouldBeEqualResultCode}
    
    ${shouldBeEqualResultDescription}=    Run Keyword If    '${res_name}' == '${SINGNIN}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_SINGNIN_SUCCESS}    #singnin
    ...    ELSE IF    '${res_name}' == '${CREATEPARTNER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_CREATEPARTNER_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${CREATEACCOUNT}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_CREATEACCOUNT_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${CREATEATHINGHAVEWORKER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_CREATEATHINGHAVEWORKER_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${CREATEATHINGNOTHAVEWORKER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_CREATEATHINGHAVEWORKER_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${UPDATEATHING}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_UPDATEATHING_SUCCESS}    #update
    ...    ELSE IF    '${res_name}' == '${PARTIALUPDATEATHING}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_PARTIALUPDATEATHING_SUCCESS}    #patch
    ...    ELSE IF    '${res_name}' == '${RETURNSALISTOFTHING}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_RETURNSALISTOFTHING_SUCCESS}    #Inquiry
    ...    ELSE IF    '${res_name}' == '${THINGRETURNSALISTOFTHING}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_THINGRETURNSALISTOFTHING_SUCCESS}    #Inquiry
    ...    ELSE IF    '${res_name}' == '${CREATEAWORKER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_CREATEAWORKER_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${DELETEAWORKER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_DELETEAWORKER_SUCCESS}    #remove
    ...    ELSE IF    '${res_name}' == '${ACTIVATETHINGS_CENTRIC}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_ACTIVATETHINGS_CENTRIC_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${ACTIVATETHING_CORE}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_ACTIVATETHING_CORE_SUCCESS}    #create   
    ...    ELSE IF    '${res_name}' == '${IMPORTTHING}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${MAPPINGIMEI}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_MAPPINGIMEI_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${CREATEAWHITELIST}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_CREATEAWHITELIST_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${REMOVEPARTNER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_REMOVEPARTNER_SUCCESS}    #remove
    ...    ELSE IF    '${res_name}' == '${REMOVEACCOUNT}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_REMOVEACCOUNT_SUCCESS}    #remove
    ...    ELSE IF    '${res_name}' == '${REMOVEATHING}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_REMOVEATHING_SUCCESS}    #remove
    ...    ELSE IF    '${res_name}' == '${UPDATEACCOUNT}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_UPDATEACCOUNT_SUCCESS}    #update
    ...    ELSE IF    '${res_name}' == '${INQUIRYACCOUNT}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_INQUIRYACCOUNT_SUCCESS}    #Inquiry        
    ...    ELSE IF    '${res_name}' == '${DELETEAWHITELIST}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_DELETEAWHITELIST_SUCCESS}    #remove
    ...    ELSE IF    '${res_name}' == '${RETURNSALISTOFWHITELIST}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_RETURNSALISTOFWHITELIST_SUCCESS}    
    ...    ELSE IF    '${res_name}' == '${UPDATEAWHITELIST}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_UPDATEAWHITELIST_SUCCESS}    #update
    ...    ELSE IF    '${res_name}' == '${VERIFIESTHINGS}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_VERIFIESTHINGS_SUCCESS}    
    ...    ELSE IF    '${res_name}' == '${UPDATEAWORKER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_UPDATEAWORKER_SUCCESS}    #update
    ...    ELSE IF    '${res_name}' == '${RETURNSALISTOFWORKER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_RETURNSALISTOFWORKER_SUCCESS}    #Inquiry
    ...    ELSE IF    '${res_name}' == '${GETAWORKERBYWORKERID}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_GETAWORKERBYWORKERID_SUCCESS}    #Inquiry
    ...    ELSE IF    '${res_name}' == '${IMPORTSLISTOFTHINGBYWORKERID}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${EXPORTSLISTOFTHINGBYWORKERID}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_EXPORTSLISTOFTHINGBYWORKERID_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${UPDATETHINGSTOWORKERS}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_UPDATETHINGSTOWORKERS_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${DELETETHINGSFROMWORKER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_DELETETHINGSFROMWORKER_SUCCESS}    #create
    ...    ELSE IF    '${res_name}' == '${IMPORTTHINGBYSUPPLIER}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_IMPORTTHINGBYSUPPLIER_SUCCESS}    #create

    # Log To Console    shouldBeEqualResultDescription${shouldBeEqualResultDescription}

    ${result}=    Set Variable If    '${shouldBeEqualResultCode}'=='None' and '${shouldBeEqualResultDescription}'=='None'    true
    ...    '${shouldBeEqualResultCode}'!='None' and '${shouldBeEqualResultDescription}'!='None'    false

    # Log To Console    resultresultresult${result}
    [Return]    ${result}

#Should Have Response ResultCode = 50000 and resultDescription = System error
Response ResultCode Should Have SystemError
    [Arguments]    ${resultCode}    ${resultDescription}
    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultCode}    ${VALUE_RESULTCODE_50000} 
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_RESULTDESCRIPTION_SYSTEMERROR}  

Response ResultCode Should Have Error
    [Arguments]    ${res_json}    ${res_name}   ${field_OperationStatus}    ${field_Code}    ${field_Description}    ${Code}    ${Description}  

    # Log To Console    field_Code :${field_Code}
    # Log To Console    field_Description :${field_Description}
    # Log To Console    Code :${Code}
    # Log To Console    Description :${Description}

	${operationStatus}=    Get From Dictionary    ${res_json}     ${field_OperationStatus}    #OperationStatus
	${resultCode}=    Get From Dictionary    ${operationStatus}     ${field_Code}    #Code
    # Log To Console    operationStatus :${operationStatus}
    ${field_Description_Developermassage}=    Set Variable If    '${res_name}'!='${CREATEATHING}'    ${field_Description}
    ...    '${res_name}'!='${CREATEAWORKER}'    ${FIELD_DEVELOPERMESSAGE}
    ...    '${res_name}'=='${CREATEATHING}'    ${FIELD_DEVELOPERMESSAGE}
    ...    '${res_name}'=='${CREATEAWORKER}'    ${FIELD_DEVELOPERMESSAGE}
    ...    '${res_name}'=='${CREATEAWHITELIST}'    ${FIELD_DEVELOPERMESSAGE}

    # Log To Console    field_Description_Developermassage :${field_Description_Developermassage}
	${resultDescription}=    Run keyword And Continue On Failure    Get From Dictionary    ${operationStatus}     ${field_Description_Developermassage}        #Description
	# Log To Console    resultDescription :${resultDescription}
    # Log To Console    resultCode${resultCode}
    # Log To Console    Code${Code}
    # Log To Console    resultDescription${resultDescription}
    # Log To Console    Description${Description}

    ${shouldBeEqualResultCode}=    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultCode}    ${Code}
    ${shouldBeEqualResultDescription}=    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${Description}
    # Log To Console    shouldBeEqualResultCode${shouldBeEqualResultCode}
    # Log To Console    shouldBeEqualResultDescription${shouldBeEqualResultDescription}

    ${result}=    Set Variable If    '${shouldBeEqualResultCode}'=='None' and '${shouldBeEqualResultDescription}'=='None'    true
    ...    '${shouldBeEqualResultCode}'!='None' and '${shouldBeEqualResultDescription}'!='None'    false

    Log To Console    resultresultresult${result}
    [Return]    ${result}


Response Code and Description Should Have Error
    [Arguments]    ${resultCode}    ${resultDescription}    ${res_name}    ${Description}    


    # Log To Console    resultCode : ${resultCode}  
    # Log To Console    resultDescription : ${resultDescription}   
    # Log To Console    res_name : ${res_name} 
    # Log To Console    Description : ${Description}   


    ${shouldBeEqualResultCode}=    Run Keyword If    "${resultCode}" == "${VALUE_RESULTCODE_40400}"    Should Be Equal As Strings    ${resultCode}    ${VALUE_RESULTCODE_40400}
    ...    ELSE IF    ${resultCode} == "${VALUE_RESULTCODE_40000}"    Should Be Equal As Strings    ${resultCode}    ${VALUE_RESULTCODE_40000}


    
    ${shouldBeEqualResultDescription}=    Run Keyword If    '${res_name}' == '${CREATEAWHITELIST}' and '${Description}' == '${VALUE_DESCRIPTION_THETHINGIDENTIFIERCOULDNOTBEFOUND_ERROR}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_THETHINGIDENTIFIERCOULDNOTBEFOUND_ERROR}   
    ...    ELSE IF    '${res_name}' == '${CREATEAWHITELIST}' and '${Description}' == '${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}'    Run keyword And Continue On Failure    Should Be Equal As Strings    ${resultDescription}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR} 


    ${result}=    Set Variable If    '${shouldBeEqualResultCode}'=='None' and '${shouldBeEqualResultDescription}'=='None'    true
    ...    '${shouldBeEqualResultCode}'!='None' and '${shouldBeEqualResultDescription}'!='None'    false

    # Log To Console    resultresultresult${result}
    [Return]    ${result}


Response Array Should Have
    [Arguments]    ${res_json}    ${flow}    ${field_Status}    ${field_despcription}   ${expectResponse}

    Log To Console    expectResponse${expectResponse}
    ${data_countRes}=    Get Length    ${res_json}
    # Log To Console    ${data_countRes}
    ${data_countExpectRes}=    Get Length    ${expectResponse}
    # Log To Console    ${data_countRes}

    # check number response
    Run keyword And Continue On Failure    Should Be Equal As Numbers    ${data_countRes}    ${data_countExpectRes}

    @{valArrCheck}=    Create List
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
        ${status}=    Get From Dictionary    ${res_json}[${i}]     ${field_Status}
        # ${status}=    Set Variable   ${res_json}[${i}]${field_Status}
		# Log To Console    status${status}
        ${StatusDespcription}=    Get From Dictionary    ${res_json}[${i}]     ${field_despcription}
		# ${StatusDespcription}=    Set Variable   ${res_json}[${i}][${field_despcription}]
	    # Log To Console    StatusDespcription${StatusDespcription}

        # Log To Console    expectResponse${expectResponse}
        # Log To Console    expectResponse${expectResponse}[${i}][${field_Status}]
        ${result1}=    Run keyword And Continue On Failure    Should Be Equal As Strings    ${status}    ${expectResponse}[${i}][${field_Status}]
        ${result2}=    Run keyword And Continue On Failure    Should Be Equal As Strings    ${StatusDespcription}    ${expectResponse}[${i}][${field_despcription}]
        Append To List    ${valArrCheck}    ${result1}
        Append To List    ${valArrCheck}    ${result2}
    #Exit For Loop
	END
    # Log To Console    valArrCheck${valArrCheck}
    # ${matches}=    Get Matches    ${valArrCheck}    None
    # Log To Console    matches${matches}
    ${result}=    Set Variable If    '${result1}'=='None' and '${result2}'=='None'    true
    ...    '${result1}'!='None' and '${result2}'!='None'    false

    [Return]    ${result}

Response Status And StatusDespcription Should Have
    [Arguments]    ${res_json}    ${flow}

    ${data_countRes}=    Get Length    ${res_json}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res_json}[${i}]     ${FIELD_STATUS}
		Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res_json}[${i}][${FIELD_STATUSDESCRIPTION}]
	    Log To Console    StatusDespcription${StatusDespcription}
        ${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${flow}
	#Exit For Loop
	END

    [Return]    ${result}




Response Status And StatusDespcription Should Have Error
    [Arguments]    ${res_json}    ${description}

    ${data_countRes}=    Get Length    ${res_json}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res_json}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res_json}[${i}][${FIELD_STATUSDESCRIPTION}]
	    # Log To Console    StatusDespcription${StatusDespcription}
    ${result}=    Run keyword And Continue On Failure    Response Code and Description Should Have Error    ${status}    ${StatusDespcription}    ${CREATEAWHITELIST}    ${description}    
	#Exit For Loop
	END

    [Return]    ${result}
