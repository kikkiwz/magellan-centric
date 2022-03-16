*** Keywords ***
####################################################
Rollback Data DeleteAWorker
	#WorkerId
	[Arguments]    ${Flow}    ${id}

    ${result}=    Run Keyword And Return Status    Request RemoveData DeleteAWorker    ${id}
	Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data DeleteAWorker2
	#WorkerIdArr
	[Arguments]    ${Flow}    ${idArr}

    ${result}=    Run Keyword And Return Status    Request RemoveData DeleteAWorker2    ${idArr}
	Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data DeleteAWorker and DeleteAThingArr
	[Arguments]    ${Flow}    ${thingIdArr}    ${workerId}  

    ${result}=    Run Keyword And Return Status    Request RemoveData DeleteAWorker and DeleteAThingArr    ${thingIdArr}    ${workerId}
	Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data DeleteAWorkerArr and DeleteAThingArr
	[Arguments]    ${Flow}    ${thingIdArr}    ${workerIdArr}  
    Log To Console    DeleteAWorkerArrFlow${Flow}
    ${result}=    Run Keyword And Return Status    Request RemoveData DeleteAWorkerArr and DeleteAThingArr    ${thingIdArr}    ${workerIdArr}
	Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data DeleteAThingArr
	[Arguments]    ${Flow}    ${thingArr} 

    ${result}=    Run Keyword And Return Status    Request RemoveData DeleteAThingArr    ${thingArr}
	Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner Account AThing and Whitelist
	[Arguments]    ${getData}    ${OwnerId}
	Log To Console    getData : ${getData}
	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]
	${CustomerId}=    Set Variable    ${getData}[2]
	${AccountId}=    Set Variable    ${getData}[3]
	${AThingId}=    Set Variable    ${getData}[5]
	${ThingIdentifier}=    Set Variable    ${getData}[7]    
	
    ${result}=    Run Keyword And Return Status    Request RemoveData Partner Account AThing and Whitelist    ${accessToken}    ${PartnerId}    ${CustomerId}    ${AccountId}    ${AThingId}    ${ThingIdentifier}    ${OwnerId}    
	Log To Console    result:::::${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner Account and AThing 
	[Arguments]    ${Flow}    ${getData}
	Log To Console    getData : ${getData}
	${accessToken}=    Set Variable    ${getData}[0]
	${CustomerId}=    Set Variable    ${getData}[2]
	${PartnerId}=    Set Variable    ${getData}[1]
	${AccountId}=    Set Variable    ${getData}[3]
	${AThingId}=    Set Variable    ${getData}[5]

    ${result}=    Run Keyword And Return Status    Request RemoveData Partner Account AThing    ${accessToken}    ${PartnerId}    ${CustomerId}    ${AccountId}    ${AThingId}    
	Log To Console    result:::::${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Delete Worker and AThing
	[Arguments]    ${Flow}    ${getData}
	Log To Console    getData : ${getData}
	${WorkerId}=    Set Variable    ${getData}[0]
	${AThingId}=    Set Variable    ${getData}[1]

    ${result}=    Run Keyword And Return Status    Request RemoveData Worker and AThing    ${WorkerId}    ${AThingId}        
	Log To Console    result:::::${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Delete Worker and AThing2DATA
	[Arguments]    ${Flow}    ${getData}
	Log To Console    getData : ${getData}
	${WorkerId}=    Set Variable    ${getData}[0]
	@{AThingIdArr}=    Set Variable    ${getData}[1]    ${getData}[5]
	Log To Console    AThingIdArr : ${AThingIdArr}

    ${result}=    Run Keyword And Return Status    Request RemoveData Worker and AThing2DATA    ${WorkerId}    ${AThingIdArr}        
	Log To Console    result:::::${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Delete AThing
	[Arguments]    ${Flow}    ${AThingId}

    ${result}=    Run Keyword And Return Status    Delete A Thing    ${URL_CENTRIC}    ${AThingId}       
	Log To Console    result:::::${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Delete AThing Only
	[Arguments]    ${Flow}    ${getData}
	Log To Console    getData : ${getData}

	${AThingId}=    Set Variable If    '${Flow}'=='${THINHG}'    ${getData}[0]
	...    '${Flow}'!='${THINHG}'    ${getData}[1]

    ${result}=    Run Keyword And Return Status    Request RemoveData AThing Only    ${AThingId}        
	Log To Console    result:::::${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}


Rollback Data Remove Partner Account and AThing Array
	[Arguments]    ${Flow}    ${getData}
	Log To Console    getData : ${getData}
	${accessToken}=    Set Variable    ${getData}[0]
	${CustomerId}=    Set Variable    ${getData}[2]

	${PartnerId}=    Set Variable    ${getData}[1]
	${AccountId}=    Set Variable    ${getData}[3]
	${AThingId}=    Set Variable    ${getData}[15]

	${PartnerId2}=    Set Variable    ${getData}[8]
	${AccountId2}=    Set Variable    ${getData}[10]
	${AThingId2}=    Set Variable    ${getData}[16]


    ${result}=    Run Keyword And Return Status    Request RemoveData Partner Account AThing Array    ${accessToken}    ${PartnerId}    ${AccountId}    ${AThingId}    ${PartnerId2}    ${AccountId2}    ${AThingId2}    
	Log To Console    result:::::${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}



