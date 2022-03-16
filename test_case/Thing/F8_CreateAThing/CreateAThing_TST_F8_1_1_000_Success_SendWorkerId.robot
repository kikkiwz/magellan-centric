*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAThing_TST_F8_1_1_000_Success_SendWorkerId
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Thing
	...    3.Delete a Worker
	...    4.Delete a Thing
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
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEATHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#WorkerName
    ${random_number}=    generate random string    6    [NUMBERS]
    ${random_thingIdentifier}=    generate random string    13    [NUMBERS]
    ${random_thingSecret}=    generate random string    20    [NUMBERS]
    ${random_imei}=    generate random string    20    [NUMBERS]
	${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}    
    ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}
	${ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${random_thingIdentifier}
    ${ThingSecret}=    Set Variable    ${random_thingSecret}
    ${IMEI}=    Set Variable    ${random_imei}
	${ConnectivityType}=    Set Variable    ${VALUE_CONNECTIVITYTYPE_NBIOT}
    ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
    ${CustomDetails_Key}=    Set Variable    ${VALUE_CUSTOMDETAILKEY}
    ${CustomDetails_Value}=    Set Variable    ${random_number}

	${ThingState}=    Set Variable    Idle
    Log To Console    WorkerName is : ${ThingName}

	#Body
    ${body}=    Evaluate    {"WorkerId": "${WorkerId}","ConnectivityType": "${ConnectivityType}","ThingName" : "${ThingName}","ThingIdentifier": "${ThingIdentifier}","ThingSecret": "${ThingSecret}","IMEI": "${IMEI}","CustomDetails":{"${CustomDetails_Key}":"${CustomDetails_Value}"},"SupplierDetail": {"SupplierId": "${SupplierId}","SupplierName": "${SupplierName}"}}
    Log To Console    Body is : ${body}
    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_CREATEATHING}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEATHINGHAVEWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    #GetResponse_ThingId
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
	${ThingId}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGID}    
	Log To Console    ThingId is : ${ThingId}

	${GetResponse_WorkerId}=    Get From Dictionary    ${ThingInfo}     ${FIELD_WORKERID}  
	${GetResponse_ConnectivityType}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CONNECTIVITYTYPE}    
	${GetResponse_ThingName}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGNAME}   
	${GetResponse_ThingIdentifier}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGIDENTIFIER}   
	${GetResponse_ThingSecret}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSECRET}   
	${GetResponse_IMEI}=    Get From Dictionary    ${ThingInfo}     ${FIELD_IMEI} 
	${GetResponse_ThingState}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGSTATE}  
	${GetResponse_CustomDetails}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CUSTOMDETAILS} 
	${GetResponse_CustomDetails_Key}=    Get From Dictionary    ${GetResponse_CustomDetails}     ${VALUE_CUSTOMDETAILKEY}  
	${GetResponse_SupplierDetail}=    Get From Dictionary    ${ThingInfo}     ${FIELD_SUPPLIERDETAILS}  
	${GetResponse_SupplierDetail_SupplierId}=    Get From Dictionary    ${GetResponse_SupplierDetail}     ${FIELD_SUPPLIERID} 
	${GetResponse_SupplierDetail_SupplierName}=    Get From Dictionary    ${GetResponse_SupplierDetail}     ${FIELD_SUPPLIERNAME} 
	${GetResponse_SupplierDetail_CreatedDatetime}=    Get From Dictionary    ${ThingInfo}     ${FIELD_CREATEDATETIME} 
	${GetResponse_SupplierDetail_LastUpdatedTimestamp}=    Get From Dictionary    ${ThingInfo}     ${FIELD_LASTUPDATETINESTAMP}

	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_WorkerId}    ${WorkerId}    
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ConnectivityType}    ${VALUE_CONNECTIVITYTYPE_NBIOT}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingName}    ${ThingName}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingIdentifier}    ${ThingIdentifier}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingSecret}    ${ThingSecret}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_IMEI}    ${IMEI}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ThingState}    ${ThingState}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_CustomDetails_Key}    ${random_number}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierDetail_SupplierId}    ${SupplierId}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_SupplierDetail_SupplierName}    ${SupplierName}
	Should Not Be Empty    ${GetResponse_SupplierDetail_CreatedDatetime}
	Should Not Be Empty    ${GetResponse_SupplierDetail_LastUpdatedTimestamp}

    ${pathUrl}=    Set Variable    ${URL_CREATEATHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEATHING}${current_timestamp}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
    ${bodyLog}=    Set Variable    {"WorkerId":"${WorkerId}","ConnectivityType":"${ConnectivityType}","ThingName":"${ThingName}","ThingIdentifier":"${ThingIdentifier}","ThingSecret":"${ThingSecret}","IMEI":"${IMEI}","CustomDetails":{"${CustomDetails_Key}":"${CustomDetails_Value}"},"SupplierDetail":{"SupplierId":"${SupplierId}","SupplierName":"${SupplierName}"}}
	Log CreateAThing Success    ${res}    ${pathUrl}    ${dataSearch}    ${WorkerId}    ${bodyLog}

    #Inquiry for verify DB   
	${idDelete}=    Create List    ${WorkerId}    ${ThingId}
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Things    ${ThingId}    ${WorkerId}    ${ConnectivityType}    ${ThingName}    ${ThingIdentifier}    ${ThingSecret}    ${IMEI}    ${ThingState}    ${SupplierId}    ${SupplierName}    ${CustomDetails_Key}    ${CustomDetails_Value}
    [Teardown]    Generic Test Case Teardown    ${CREATEATHINGHAVEWORKER}    ${idDelete}    ${EMPTY}


