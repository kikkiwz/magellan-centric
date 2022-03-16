*** Settings ***
Resource    ../../../variables/Variables.robot    
Resource    ../../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
DeleteRawThing_TST_F3_1_1_000_Success
    [Documentation]    Step is :    
	...    1.Create a Worker
	...    2.Create a Thing
	...    3.Update a Thing
	...    4.Delete a Worker
	...    5.Delete a Thing
	#====== Start Prepare data ==========
    ${prepare_data}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore for CreateAWhitelist    1
    ${data}=    Set Variable    ${prepare_data}[0]    
    ${Getdata}=    Set Variable    ${data}[0] 
    ${ThingIdentifier_import}=    Set Variable    ${Getdata['ThingIdentifier']}
    ${ThingName_import}=    Set Variable    ${Getdata['ThingName']}
    ${ThingSecret_import}=    Set Variable    ${Getdata['ThingSecret']}
    ${ConnectivityType_import}=    Set Variable    ${Getdata['ConnectivityType']}
	${data_import}=    Evaluate    [{ "ConnectivityType": "${ConnectivityType_import}", "ThingName": "${ThingName_import}", "ThingIdentifier": "${ThingIdentifier_import}", "ThingSecret": "${ThingSecret_import}"}]
    # Import Thing
	${postImportThing}=	   Import Thing    ${URL_CENTRIC}    null    ${data_import}
    Log To Console    postImportThing${postImportThing}  
	${data_response}=    Set Variable    ${postImportThing}[0]
	Log    ${data_response}  

    #Inquiry get thing
	Connect To Mongodb    ${CONNECT_TO_MONGODB}
	${json_data}=    Set Variable    {"ThingIdentifier":"${ThingIdentifier_import}"}
    ${result_thing}=    Search All Fields    ${json_data}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
	${ThingId}=    Get From Dictionary    ${result_thing}    _id
	${ThingId_Str}=    Convert To String    ${ThingId}	
    Disconnect From Mongodb	
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${ThingState}=    Set Variable    ${VALUE_THINGSTATE_MENUFACTURING}
    
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETERAWTHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETERAWTHING}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request Not Data    ${URL_CENTRIC}${CENTRICAPIS}    ${URL_REMOVEATHING}/${ThingId}/Raw    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEATHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}


    ${pathUrl}=    Set Variable    ${URL_REMOVEATHING}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETERAWTHING}${current_timestamp}
			

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log DeleteRawThing Success    ${res}    ${pathUrl}    ${dataSearch}      

   
    #Inquiry for verify DB   
	Connect To Mongodb    ${CONNECT_TO_MONGODB}
	${json_data}=    Set Variable    {"ThingIdentifier":"${ThingIdentifier_import}"}
    ${result_thing}=    Search All Fields    ${json_data}    ${MONGODB_DBNAME_MGCENTRIC}    ${MONGODB_DBCOLLNAME_TB_THINGS}
	Log    ${result_thing}  	
    Disconnect From Mongodb	
    #Check Search Not Found 
	Run keyword And Continue On Failure    Should Be Equal As Strings    []    ${result_thing}

