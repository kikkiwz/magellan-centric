*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Get ###################
ReturnsAListOfWorker_TST_F15_1_1_000_Success_FillterWorkerName
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Returns a list of Worker
	...    3.Delete a Worker

	#====== Start Prepare data ==========

	${fillter}=    Set Variable    ${VALUE_CENTRIC_RETURNSALISTOFWORKER_FILLTERWORKERNAME}
    Log To Console    fillter is : ${fillter}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFWORKER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_RETURNSALISTOFWORKER}${fillter}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${RETURNSALISTOFWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${URL_RETURNSALISTOFWORKER}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWORKER}${current_timestamp}

	${bodyLog}=    Set Variable    {"$Top":"10","$Select":"WorkerName","$OrderBy":"WorkerName desc"}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log ReturnsAListOfWorker Success    ${res}    ${pathUrl}    ${dataSearch}    ${bodyLog}

