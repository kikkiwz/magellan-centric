*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
PartialUpdateAThing_TST_F12_0_2_002_Error_op_remove 
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Thing
	...    3.Update a Thing
	...    4.Delete a Worker
	...    5.Delete a Thing
	#====== Start Prepare data ==========
	${ServerIPCreate}=    Set Variable    ${VALUE_SERVERIP}
	Log To Console    ServerIP Create is : ${ServerIPCreate}
	${ServerPortCreate}=    Set Variable    ${VALUE_SERVERPORT}
	Log To Console    ServerPort Create is : ${ServerPortCreate}
	${ServerDomainCreate}=    Set Variable    ${VALUE_SERVERDOMAIN}
	Log To Console    ServerDomain Create is : ${ServerDomainCreate}
	${WorkerStateCreate}=    Set Variable    ${VALUE_WORKERSTATE_TERMINATED}
	Log To Console    WorkerState Create is : ${WorkerStateCreate}
    #Create A Worker
	${postCreateAWorker}=    Create A Worker    ${URL_CENTRIC}    ${ServerIPCreate}    ${ServerPortCreate}    ${ServerDomainCreate}    ${WorkerStateCreate}
    Log To Console    postCreateAWorker :${postCreateAWorker}
    ${WorkerId}=    Set Variable    ${postCreateAWorker}[0]
    Log To Console    WorkerId is : ${WorkerId}

    #Prepare data for create
    ${dataCreateAWhitelist}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1 
    ${data}=    Set Variable    ${dataCreateAWhitelist}[0] 
    Log To Console    data${data}      
    ${Getdata}=    Set Variable    ${data}[0] 
    ${ThingIdentifier_Create}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingSecret_Create}=    Set Variable    ${Getdata['ThingSecret']}
    ${IMEI_Create}=    Set Variable    ${Getdata['IMEI']}
    ${ConnectivityType_Create}=    Set Variable    ${Getdata['ConnectivityType']}
    ${ThingState_Create}=    Set Variable    ${VALUE_THINGSTATE_IDLE}

    #Create A Thing
	${postCreateAThing_1st}=    Create A Thing Have WorkerId    ${URL_CENTRIC}    ${ConnectivityType_Create}    ${ThingState_Create}    ${ThingIdentifier_Create}    ${ThingSecret_Create}    ${IMEI_Create}    ${WorkerId}
    Log To Console    postCreateAThing_1st :${postCreateAThing_1st}

    #GetResponse_ThingId
	${ThingId}=    Set Variable    ${postCreateAThing_1st}[0] 
	${ThingName_Create}=    Set Variable    ${postCreateAThing_1st}[4] 
	${SupplierId_Create}=    Set Variable    ${postCreateAThing_1st}[5] 
	${SupplierName_Create}=    Set Variable    ${postCreateAThing_1st}[6]   
   
	#====== End Prepare data ==========

    ${random_number}=    generate random string    6    [NUMBERS]
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_PARTIALUPDATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Prepare data for update
    ${path}=    Set Variable    Test

	#Body
    ${body}=    Evaluate    [{"op": "replace","path": "${path}","value":"${random_number}"}]

    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Patch Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_PARTIALUPDATEATHING}/${ThingId}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${PARTIALUPDATEATHING}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
	
    #GetResponse_Details
    ${Target}=    Set Variable    ThingsUpdateDto
    ${DeveloperMessage}=    Set Variable    The target location specified by path segment '${path}' was not found.
	${responseObjectDetail}=    Set Variable    [{'Target': '${Target}', 'DeveloperMessage': "${DeveloperMessage}"}]
    ${GetResponse_OperationStatus}=    Get From Dictionary    ${res}     ${FIELD_OPERATIONSTATUS}   
    ${GetResponse_Details}=    Get From Dictionary    ${GetResponse_OperationStatus}     ${FIELD_DETAILS}   

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Details}    ${responseObjectDetail}

    ${pathUrl}=    Set Variable    ${URL_PARTIALUPDATEATHING}${ThingId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_PARTIALUPDATEATHING}${current_timestamp}
    
	#====== Check log and Verify DB ==========
	#Check log detail and summary
    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetailLog}=    Set Variable    [{"Target":"${Target}","DeveloperMessage":"${DeveloperMessage}"}]
	${bodyLog}=    Set Variable    [{"op":"replace","path":"${path}","value":"${random_number}"}]
	Log PartailUpdateAThing Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetailLog}    ${bodyLog} 

    #Inquiry for verify DB   
    [Teardown]    Generic Test Case Teardown    ${CREATEATHINGNOTHAVEWORKER}    ${EMPTY}    ${ThingId}


