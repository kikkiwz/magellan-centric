*** Variables ***
#-------------------------------------------- signin --------------------------------------------#	
#path url signin
${URL_SIGNIN}    /api/v1/auth/signin

#header Signin
${HEADER_X_AIS_ORDERREF_SIGNIN}    Signin_
${HEADER_X_AIS_ORDERREF_SIGNIN_FAIL}    Signinfail_
${HEADER_X_AIS_ORDERDESC_SIGNIN}    User Authentication


#response description
${VALUE_DESCRIPTION_SINGNIN_SUCCESS}    SignInProcess is Success

#request name
${SINGNIN}    Signin
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- ValidateToken --------------------------------------------#	
#path url ValidateToken
${URL_VALIDATETOKEN}    /api/v1/auth/ValidateToken

#header ValidateToken
${HEADER_X_AIS_ORDERREF_VALIDATETOKEN}    ValidateToken_
${HEADER_X_AIS_ORDERREF_VALIDATETOKEN_FAIL}    ValidateTokenfail_
${HEADER_X_AIS_ORDERDESC_VALIDATETOKEN}    ValidateToken

#response description
${VALUE_DESCRIPTION_VALIDATETOKEN_SUCCESS}    ValidateTokenProcess is Success

#request name
${VALIDATETOKEN}    ValidateToken
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- Partner --------------------------------------------#	
#-------------------------------------------- CreatePartner --------------------------------------------#	
#path url CreatePartner
${URL_CREATEPARTNER}    /api/v1/Partner/CreatePartner

#header CreatePartner
${HEADER_X_AIS_ORDERREF_CREATEPARTNER}    CreatePartner_
${HEADER_X_AIS_ORDERREF_CREATEPARTNER_FAIL}    CreatePartnerfail_
${HEADER_X_AIS_ORDERDESC_CREATEPARTNER}    CreatePartner

#value Create Partner
${VALUE_PARTNERNAME}    SC_
${VALUE_MERCHANTCONTACT}    Jida_TestMerchantContact@ais.co.th
${VALUE_CPID}    Jida_TesCPID@ais.co.th
${VALUE_ACCOUNTNAME}    Jida_TestAccountname
# ${VALUE_CONFIGGROUPNAME}    Sensor_TestThingGroupName

#response description
${VALUE_DESCRIPTION_CREATEPARTNER_SUCCESS}    CreatePartner is Success

#request name
${CREATEPARTNER}    CreatePartner
${CREATEPARTNER_OTHERROLE}    CreatePartnerOtherRole

#-------------------------------------------- UpdatePartner --------------------------------------------#	
#path url UpdatePartner
${URL_UPDATEPARTNER}    /api/v1/Partner/UpdatePartner

#header UpdatePartner
${HEADER_X_AIS_ORDERREF_UPDATEPARTNER}    UpdatePartner_
${HEADER_X_AIS_ORDERREF_UPDATEPARTNER_FAIL}    UpdatePartnerfail_
${HEADER_X_AIS_ORDERDESC_UPDATEPARTNER}    UpdatePartner

#value Update Partner
${VALUE_PARTNERNAME_UPDATE}    Update_SC_
${VALUE_MERCHANTCONTACT_UPDATE}    Update_Jida_TestMerchantContact@ais.co.th
${VALUE_CPID_UPDATE}    Update_Jida_TesCPID@ais.co.th
${VALUE_ACCOUNTNAME_UPDATE}    Update_Jida_TestAccountname
${VALUE_CONFIGGROUPNAME_UPDATE}    Update_Sensor_TestThingGroupName

#response description
${VALUE_DESCRIPTION_UPDATEPARTNER_SUCCESS}    UpdatePartner is Success

#request name
${UPDATEPARTNER}    UpdatePartner
${UPDATEPARTNER_OTHERROLE}    UpdatePartnerOtherRole
#-------------------------------------------- InquiryPartner --------------------------------------------#
#path url InquiryPartner
${URL_INQUIRYPARTNER}    /api/v1/Partner/InquiryPartner

#header InquiryPartner
${HEADER_X_AIS_ORDERREF_INQUIRYPARTNER}    InquiryPartner_
${HEADER_X_AIS_ORDERREF_INQUIRYPARTNER_FAIL}    InquiryPartnerfail_
${HEADER_X_AIS_ORDERDESC_INQUIRYPARTNER}    InquiryPartner

#response description
${VALUE_DESCRIPTION_INQUIRYPARTNER_SUCCESS}    InquiryPartner is Success    

#request name
${INQUIRYPARTNER}    InquiryPartner
${INQUIRYPARTNER_OTHERROLE}    InquiryPartnerOtherRole	

#-------------------------------------------- RemovePartner --------------------------------------------#	
#path url remove
${URL_REMOVEPARTNER}    /api/v1/Partner/RemovePartner

#header RemovePartner
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER}    RemovePartner_
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER_FAIL}    RemovePartnerfail_
${HEADER_X_AIS_ORDERDESC_REMOVEPARTNER}    RemovePartner

#request name
${REMOVEPARTNER}    RemovePartner
${REMOVEPARTNER_OTHERROLE}    RemovePartnerOtherRole

#response description
${VALUE_DESCRIPTION_REMOVEPARTNER_SUCCESS}    RemovePartner is Success
#-------------------------------------------------------------------------------------------------------#
#------------------------------------------------ Account ----------------------------------------------#	
#-------------------------------------------- CreateAccount --------------------------------------------#
#path url CreateAccount
${URL_CREATEACCOUNT}    /api/v1/Account/CreateAccount

#header CreateAccount
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}    CreateAccount_
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT_FAIL}    CreateAccountfail_
${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    CreateAccount

#value CreateAccount
${VALUE_ACCOUNTCODE}    AccountCode_

#response description
${VALUE_DESCRIPTION_CREATEACCOUNT_SUCCESS}    CreateAccount is Success

#request name
${CREATEACCOUNT}    CreateAccount
${CREATEACCOUNT_OTHERROLE}    CreateAccountOtherRole

#-------------------------------------------- UpdateAccont --------------------------------------------#
#path url UpdateAccount
${URL_UPDATEACCOUNT}    /api/v1/Account/UpdateAccount

#header UpdateAccount
${HEADER_X_AIS_ORDERREF_UPDATEACCOUNT}    UpdateAccount_
${HEADER_X_AIS_ORDERREF_UPDATEACCOUNT_FAIL}    UpdateAccountfail_
${HEADER_X_AIS_ORDERDESC_UPDATEACCOUNT}    UpdateAccount

#response description
${VALUE_DESCRIPTION_UPDATEACCOUNT_SUCCESS}    UpdateAccount is Success

#request name
${UPDATEACCOUNT}    UpdateAccount
${UPDATEACCOUNT_OTHERROLE}    UpdateAccountOtherRole


${VALUE_ACCOUNTCODE}    QATesterAcc01
${VALUE_EXPIREDATE}    2021-11-30T15:27:27.396+07:00   
${VALUE_EXPIREDATE_ERROR}    2020-11-30T15:27:27.396+07:00 
${VALUE_CLEAREXPIREDATE}    true

#-------------------------------------------- InquiryAccont --------------------------------------------#
#path url InquiryAccount
${URL_INQUIRYACCOUNT}    /api/v1/Account/InquiryAccount

#header InquiryAccount
${HEADER_X_AIS_ORDERREF_INQUIRYACCOUNT}    InquiryAccount_
${HEADER_X_AIS_ORDERREF_INQUIRYACCOUNT_FAIL}    InquiryAccountfail_
${HEADER_X_AIS_ORDERDESC_INQUIRYACCOUNT}    InquiryAccount

#response description
${VALUE_DESCRIPTION_INQUIRYACCOUNT_SUCCESS}    InquiryAccount is Success

#request name
${INQUIRYACCOUNT}    InquiryAccount
${INQUIRYACCOUNT_OTHERROLE}    InquiryAccountOtherRole

#-------------------------------------------- RemoveAccont --------------------------------------------#
#path url RemoveAccount
${URL_REMOVEACCOUNT}    /api/v1/Account/RemoveAccount

#header InquiryAccount
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT}    RemoveAccount_
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT_FAIL}    RemoveAccountfail_
${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNT}    RemoveAccount

#response description
${VALUE_DESCRIPTION_REMOVEACCOUNT_SUCCESS}    RemoveAccount is Success

#request name
${REMOVEACCOUNT}    RemoveAccount
${REMOVEACCOUNT_OTHERROLE}    RemoveAccountOtherRole

#-------------------------------------------- RemoveAcconts --------------------------------------------#
#path url RemoveAccounts
${URL_REMOVEACCOUNTS}    /api/v1/Account/RemoveAccounts

#header InquiryAccounts
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNTS}    RemoveAccounts_
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNTS_FAIL}    RemoveAccountsfail_
${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNTS}    RemoveAccounts

#response description
${VALUE_DESCRIPTION_REMOVEACCOUNTS_SUCCESS}    RemoveAccounts is Success

#request name
${REMOVEACCOUNTS}    RemoveAccounts
${REMOVEACCOUNTS_OTHERROLE}    RemoveAccountsOtherRole
#-------------------------------------------------------------------------------------------------------#



#-------------------------------------------- ActivateThing Core --------------------------------------------#	
#path url ActivateThing Core
${URL_ACTIVATETHING_CORE}    /api/v1/Thing/ActivateThing

#header ActivateThing
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE}    ActivateThing_
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE_FAIL}    ActivateThingfail_
${HEADER_X_AIS_ORDERDESC_ACTIVATETHING_CORE}    ActivateThing

#response description
${VALUE_DESCRIPTION_ACTIVATETHING_CORE_SUCCESS}    ActivateThing is Success

#request name
${ACTIVATETHING_CORE}    ActivateThingCore

#-------------------------------------------- CreateAThing --------------------------------------------#	
#path url CreateAThing
${URL_CREATEATHING}    /api/v1/Things

#header CreateAThing
${HEADER_X_AIS_ORDERREF_CREATEATHING}    CreateAThing_
${HEADER_X_AIS_ORDERDESC_CREATEATHING}    CreateAThing

#value Create CreateAThing
# ${VALUE_THINGNAME}    Sensor_TestThingName

${VALUE_DESCRIPTION_CREATEATHINGHAVEWORKER_SUCCESS}    Successfully created.
${VALUE_DESCRIPTION_CREATEATHINGNOTHAVEWORKER_SUCCESS}    The requested operation was successfully.

#request name
${CREATEATHINGHAVEWORKER}    CreateAThingHaveWorker
${CREATEATHINGNOTHAVEWORKER}    CreateAThingNotHaveWorker
${CREATEATHING}    CreateAThing

#request name
${VALUE_ATHINGNAME}    ThingName
${VALUE_SUPPLIERID}    SupplierId
${VALUE_SUPPLIERNAME}    SupplierName
${VALUE_CUSTOMDETAILKEY}    CustomDetailsKey
${VALUE_ATHINGNAME_UPDATE}    ThingName_Update
${VALUE_CUSTOMDETAILKEY_UPDATE}    CustomDetailsKey_Update

${VALUE_THINGSTATE_IDLE}    Idle
${VALUE_THINGSTATE_PENDING}    Pending
${VALUE_THINGSTATE_MENUFACTURING}    Manufacturing
${VALUE_THINGSTATE_ACTIVATED}    Activated
${VALUE_CONNECTIVITYTYPE_NBIOT}    NBIOT
${VALUE_CONNECTIVITYTYPE_WIFI}    WIFI
${VALUE_CONNECTIVITYTYPE_CELLULAR}    CELLULAR

#-------------------------------------------- UpdateAThing --------------------------------------------#	
#path url CreateAThing
${URL_UPDATEATHING}    /api/v1/Things/

#header CreateAThing
${HEADER_X_AIS_ORDERREF_UPDATEATHING}    UpdateAThing_
${HEADER_X_AIS_ORDERDESC_UPDATEATHING}    UpdateAThing

#value Create CreateAThing
# ${VALUE_THINGNAME}    Sensor_TestThingName

${VALUE_DESCRIPTION_UPDATEATHING_SUCCESS}    The requested operation was successfully.

#request name
${UPDATEATHINGHAVEWORKER}    UpdateAThingHaveWorker
${UPDATEATHINGNOTHAVEWORKER}    UpdateAThingNotHaveWorker
${UPDATEATHING}    UpdateAThing

#-------------------------------------------- PartialUpdateAThing --------------------------------------------#	
#path url CreateAThing
${URL_PARTIALUPDATEATHING}    /api/v1/Things/

#header CreateAThing
${HEADER_X_AIS_ORDERREF_PARTIALUPDATEATHING}    PartialUpdateAThing_
${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEATHING}    PartialUpdateAThing

#value Create CreateAThing
# ${VALUE_THINGNAME}    Sensor_TestThingName

${VALUE_DESCRIPTION_PARTIALUPDATEATHING_SUCCESS}    The requested operation was successfully.

#request name
${PARTIALUPDATEATHINGHAVEWORKER}    PartialAUpdateAThingHaveWorker
${PARTIALUPDATEATHINGNOTHAVEWORKER}    PartialAUpdateAThingNotHaveWorker
${PARTIALUPDATEATHING}    PartialAUpdateAThing

#-------------------------------------------- ThingReturnsAListOfThing --------------------------------------------#	
#path url ReturnsAListOfWorker
${URL_THINGRETURNSALISTOFTHING}    /api/v1/Things

#header ReturnsAListOfWorker
${HEADER_X_AIS_ORDERREF_THINGRETURNSALISTOFTHING}    ThingReturnsAListOfThing
${HEADER_X_AIS_ORDERREF_THINGRETURNSALISTOFTHING_FAIL}    ThingReturnsAListOfThingfail_
${HEADER_X_AIS_ORDERDESC_THINGRETURNSALISTOFTHING}    ThingReturnsAListOfThing

#response description
${VALUE_DESCRIPTION_THINGRETURNSALISTOFTHING_SUCCESS}    The requested operation was successfully.

#request name
${THINGRETURNSALISTOFTHING}    ThingReturnsAListOfThing

#-------------------------------------------- RemoveAThing --------------------------------------------#	
#path url remove
${URL_REMOVEATHING}    /api/v1/Things/

#header RemoveThing
${HEADER_X_AIS_ORDERREF_REMOVEATHING}    RemoveAThing_
${HEADER_X_AIS_ORDERDESC_REMOVEATHING}    RemoveAThing 

#request name
${REMOVEATHING}    RemoveAThing

#response description
${VALUE_DESCRIPTION_REMOVEATHING_SUCCESS}    The requested operation was successfully.

#-------------------------------------------- ReturnsAListOfThing --------------------------------------------#	
#path url ReturnsAListOfWorker
${URL_RETURNSALISTOFTHING}    /api/v1/Things

#header ReturnsAListOfWorker
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFTHING}    ReturnsAListOfThings_
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFTHING_FAIL}    ReturnsAListOfThingsfail_
${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFTHING}    ReturnsAListOfThings

#response description
${VALUE_DESCRIPTION_RETURNSALISTOFTHING_SUCCESS}    The requested operation was successfully.

#request name
${RETURNSALISTOFTHING}    ReturnsAListOfTHING
#-------------------------------------------- GetThingByThingId --------------------------------------------#	
#path url GetThingByThingId
${URL_GETTHINGBYTHINGID}    /api/v1/Things

#header GetThingByThingId
${HEADER_X_AIS_ORDERREF_GETTHINGBYTHINGID}    GetThingByThingId
${HEADER_X_AIS_ORDERREF_GETTHINGBYTHINGID_FAIL}    GetThingByThingIdfail_
${HEADER_X_AIS_ORDERDESC_GETTHINGBYTHINGID}    GetThingByThingId

#response description
${VALUE_DESCRIPTION_GETTHINGBYTHINGID_SUCCESS}    The requested operation was successfully.

#request name
${GETTHINGBYTHINGID}    GetThingByThingId
${GETTHINGBYTHINGIDNOTHAVEWORKER}    GetThingByThingIdNotHaveWorker
${GETTHINGBYTHINGIDHAVEWORKER}    GetThingByThingIdHaveWorker
#-------------------------------------------- Import Thing --------------------------------------------#	
#path url ImportThing
${URL_IMPORTTHING}    /api/v1/Things/Import

#header ImportThing
${HEADER_X_AIS_ORDERREF_IMPORTTHING}    ImportThing_
${HEADER_X_AIS_ORDERREF_IMPORTTHING_FAIL}    ImportThingfail_
${HEADER_X_AIS_ORDERDESC_IMPORTTHING}    ImportThing

#response description
${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}    The requested operation was successfully.

#request name
${IMPORTTHING}    ImportThing

#-------------------------------------------- Mapping IMEI --------------------------------------------#	
#path url MappingIMEI
${URL_MAPPINGIMEI}    /api/v1/Things/Mapping/IMEI

#header MappingIMEI
${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}    MappingIMEI_
${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}    MappingIMEI

#response description
${VALUE_DESCRIPTION_MAPPINGIMEI_SUCCESS}    The requested operation was successfully.

#request name
${MAPPINGIMEI}    MappingIMEI

#-------------------------------------------- DeleteRawThing --------------------------------------------#	
#path url remove
${URL_DELETERAWTHING}    /api/v1/Things/

#header RemoveThing
${HEADER_X_AIS_ORDERREF_DELETERAWTHING}    DeleteRawThing_
${HEADER_X_AIS_ORDERDESC_DELETERAWTHING}    DeleteRawThing 

#request name
${DELETERAWTHING}    DeleteRawThing

#response description
${VALUE_DESCRIPTION_DELETERAWTHING_SUCCESS}    The requested operation was successfully.


#-------------------------------------------- Import Thing By Supplier--------------------------------------------#	
#path url ImportThing
${URL_IMPORTTHINGBYSUPPLIER}    /api/v1/Suppliers/

#header ImportThing
${HEADER_X_AIS_ORDERREF_IMPORTTHINGBYSUPPLIER}    ImportThingBySupplier
${HEADER_X_AIS_ORDERREF_IMPORTTHINGBYSUPPLIER_FAIL}    IImportThingBySupplierfail_
${HEADER_X_AIS_ORDERDESC_IMPORTTHINGBYSUPPLIER}    ImportThingBySupplier

#response description
${VALUE_DESCRIPTION_IMPORTTHINGBYSUPPLIER_SUCCESS}    The requested operation was successfully.

#request name
${IMPORTTHINGBYSUPPLIER}    ImportThingBySupplier



#-------------------------------------------- ActivateThings Centric --------------------------------------------#	
#path url ActivateThings Centric
${URL_ACTIVATETHINGS_CENTRIC}    /api/v1/Capability/Worker/{WorkerId}/Thing/Activates

#header ActivateThings
${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS_CENTRIC}    ActivateThings_
${HEADER_X_AIS_ORDERDESC_ACTIVATETHINGS_CENTRIC}    ActivateThings

#response description
${VALUE_DESCRIPTION_ACTIVATETHINGS_CENTRIC_SUCCESS}    The requested operation was successfully.

#request name
${ACTIVATETHINGS_CENTRIC}    ActivateThingsCentric
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- Worker --------------------------------------------#
#-------------------------------------------- CreateAWorker --------------------------------------------#	
#path url CreateAWorker
${URL_CREATEAWORKER}    /api/v1/Workers

#header CreateAWorker
${HEADER_X_AIS_ORDERREF_CREATEAWORKER}    CreateAWorker_
${HEADER_X_AIS_ORDERREF_CREATEAWORKER_FAIL}    CreateAWorkerfail_
${HEADER_X_AIS_ORDERDESC_CREATEAWORKER}    CreateAWorker

#response description
${VALUE_DESCRIPTION_CREATEAWORKER_SUCCESS}    Successfully created.

#request name
${CREATEAWORKER}    CreateAWorker

#value
${VALUE_WORKNAME}    Worker
${VALUE_SERVERIP}    127.0.2.2
${VALUE_SERVERPORT}    8080
${VALUE_SERVERDOMAIN}    Worker001.com

${VALUE_WORKERSTATE_ACTIVATED}    Activated
${VALUE_WORKERSTATE_TERMINATED}    Terminated
${VALUE_WORKERSTATE_IDLE}    Idle
${VALUE_WORKERSTATE_TEST}    Test

#-------------------------------------------- UpdateAWorker --------------------------------------------#	
#path url UpdateAWorker
${URL_UPDATEAWORKER}    /api/v1/Workers/

#header UpdateAWorker
${HEADER_X_AIS_ORDERREF_UPDATEAWORKER}    UpdateAWorker_
${HEADER_X_AIS_ORDERREF_UPDATEAWORKER_FAIL}    UpdateAWorkerfail_
${HEADER_X_AIS_ORDERDESC_UPDATEAWORKER}    UpdateAWorker

#response description
${VALUE_DESCRIPTION_UPDATEAWORKER_SUCCESS}    The requested operation was successfully.

#request name
${UPDATEAWORKER}    UpdateAWorker
${UPDATEAWORKER2}    UpdateAWorker2

#value
${VALUE_UPDATE_WORKNAME}    WorkerUpdate
${VALUE_UPDATE_SERVERIP}    127.0.1.1
${VALUE_UPDATE_SERVERPORT}    8181
${VALUE_UPDATE_SERVERDOMAIN}    Worker0021.com
${VALUE_WORKERID_TEST}    Test

#-------------------------------------------- PartialUpdateAWorker --------------------------------------------#	
#path url PartialUpdateAWorker
${URL_PARTIALUPDATEAWORKER}    /api/v1/Workers/

#header PartialUpdateAWorker
${HEADER_X_AIS_ORDERREF_PARTIALUPDATEAWORKER}    PartialUpdateAWorker_
${HEADER_X_AIS_ORDERREF_PARTIALUPDATEAWORKER_FAIL}    PartialUpdateAWorkerfail_
${HEADER_X_AIS_ORDERDESC_PARTIALUPDATEAWORKER}    PartialUpdateAWorker

#response description
${VALUE_DESCRIPTION_PARTIALUPDATEAWORKER_SUCCESS}    The requested operation was successfully.

#request name
${PARTIALUPDATEAWORKER}    PartialUpdateAWorker
${PARTIALUPDATEAWORKER2}    PartialUpdateAWorker2

#value
${VALUE_PARTIALUPDATE_OP_ADD}    add
${VALUE_PARTIALUPDATE_OP_REPLACE}    replace
${VALUE_PARTIALUPDATE_OP_REMOVE}    remove
${VALUE_PARTIALUPDATE_PATH_SERVERPROPERTIES_SERVERIP}    ServerProperties/ServerIP
${VALUE_PARTIALUPDATE_PATH_SERVERPROPERTIES_SERVERPORT}    ServerProperties/ServerPort
${VALUE_PARTIALUPDATE_PATH_SERVERPROPERTIES_SERVERDOMAIN}    ServerProperties/ServerDomain
${VALUE_PARTIALUPDATE_PATH_SERVERPROPERTIES_TEST}    ServerProperties/test
${VALUE_PARTIALUPDATE_PATH_WORKERNAME}    WorkerName
${VALUE_PARTIALUPDATE_SERVERIP}    10.1.2.3
${VALUE_PARTIALUPDATE_SERVERPORT}    8000
${VALUE_PARTIALUPDATE_SERVERDOMAIN}    Worker002.com
${VALUE_PARTIALUPDATE_SERVERPROPERTIES_TEST}    Test
#-------------------------------------------- ReturnsAListOfWorker --------------------------------------------#	
#path url ReturnsAListOfWorker
${URL_RETURNSALISTOFWORKER}    /api/v1/Workers

#header ReturnsAListOfWorker
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWORKER}    ReturnsAListOfWorker_
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWORKER_FAIL}    ReturnsAListOfWorkerfail_
${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFWORKER}    ReturnsAListOfWorker

#response description
${VALUE_DESCRIPTION_RETURNSALISTOFWORKER_SUCCESS}    The requested operation was successfully.

#request name
${RETURNSALISTOFWORKER}    ReturnsAListOfWorker
#-------------------------------------------- GetAWorkerByWorkerId --------------------------------------------#	
#path url GetAWorkerByWorkerId
${URL_GETAWORKERBYWORKERID}    /api/v1/Workers/

#header GetAWorkerByWorkerId
${HEADER_X_AIS_ORDERREF_GETAWORKERBYWORKERID}    GetAWorkerByWorkerId_
${HEADER_X_AIS_ORDERREF_GETAWORKERBYWORKERID_FAIL}    GetAWorkerByWorkerIdfail_
${HEADER_X_AIS_ORDERDESC_GETAWORKERBYWORKERID}    GetAWorkerByWorkerId

#response description
${VALUE_DESCRIPTION_GETAWORKERBYWORKERID_SUCCESS}    The requested operation was successfully.

#request name
${GETAWORKERBYWORKERID}    GetAWorkerByWorkerId
#-------------------------------------------- DeleteAWorker --------------------------------------------#	
#path url remove
${URL_DELETEAWORKER}    /api/v1/Workers/

#header DeleteAWorker
${HEADER_X_AIS_ORDERREF_DELETEAWORKER}    DeleteAWorker_
${HEADER_X_AIS_ORDERREF_DELETEAWORKER_FAIL}    DeleteAWorkerfail_
${HEADER_X_AIS_ORDERDESC_DELETEAWORKER}    DeleteAWorker

#request name
${DELETEAWORKER}    DeleteAWorker

#response description
${VALUE_DESCRIPTION_DELETEAWORKER_SUCCESS}    The requested operation was successfully.
#-------------------------------------------- ImportsListOfThingByWorkerId --------------------------------------------#	
#path url ImportsListOfThingByWorkerId
${URL_IMPORTSLISTOFTHINGBYWORKERID}    /api/v1/Workers/WorkerId/Import/Things
${URL_IMPORTSLISTOFTHINGBYWORKERID_NOWORKERID}    /api/v1/Workers/Import/Things

#header ImportsListOfThingByWorkerId
${HEADER_X_AIS_ORDERREF_IMPORTSLISTOFTHINGBYWORKERID}    ImportsListOfThingByWorkerId_
${HEADER_X_AIS_ORDERREF_IMPORTSLISTOFTHINGBYWORKERID_FAIL}    ImportsListOfThingByWorkerIdfail_
${HEADER_X_AIS_ORDERDESC_IMPORTSLISTOFTHINGBYWORKERID}    ImportsListOfThingByWorkerId

#response description
${VALUE_DESCRIPTION_IMPORTSLISTOFTHINGBYWORKERID_SUCCESS}    The requested operation was successfully.

#request name
${IMPORTSLISTOFTHINGBYWORKERID}    ImportsListOfThingByWorkerId
#-------------------------------------------- ExportsListOfThingsByWorkerId --------------------------------------------#	
#path url ExportsListOfThingsByWorkerId
${URL_EXPORTSLISTOFTHINGBYWORKERID}    /api/v1/Workers/WorkerId/Export/Things
${URL_EXPORTSLISTOFTHINGBYWORKERID_NOWORKERID}    /api/v1/Workers/Export/Things

#header ExportsListOfThingsByWorkerId
${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID}    ExportsListOfThingsByWorkerId_
${HEADER_X_AIS_ORDERREF_EXPORTSLISTOFTHINGBYWORKERID_FAIL}    ExportsListOfThingsByWorkerIdfail_
${HEADER_X_AIS_ORDERDESC_EXPORTSLISTOFTHINGBYWORKERID}    ExportsListOfThingsByWorkerId

#response description
${VALUE_DESCRIPTION_EXPORTSLISTOFTHINGBYWORKERID_SUCCESS}    The requested operation was successfully.

#request name
${EXPORTSLISTOFTHINGBYWORKERID}    ExportsListOfThingsByWorkerId

#-------------------------------------------- AssignThingsToWorkers --------------------------------------------#	
#path url AssignThingsToWorkers
${URL_ASSIGNTHINGSTOWORKERS}    /api/v1/Workers/WorkerId/Thing/Assign
${URL_ASSIGNTHINGSTOWORKERS_NOWORKERID}    /api/v1/Workers/Thing/Assign

#header AssignThingsToWorkers
${HEADER_X_AIS_ORDERREF_ASSIGNTHINGSTOWORKERS}    AssignThingsToWorkers_
${HEADER_X_AIS_ORDERREF_ASSIGNTHINGSTOWORKERS_FAIL}    AssignThingsToWorkersfail_
${HEADER_X_AIS_ORDERDESC_ASSIGNTHINGSTOWORKERS}    AssignThingsToWorkers

#response description
${VALUE_DESCRIPTION_ASSIGNTHINGSTOWORKERS_SUCCESS}    The requested operation was successfully.

#request name
${ASSIGNTHINGSTOWORKERS}    AssignThingsToWorkers

#-------------------------------------------- UpdateThingsToWorkers --------------------------------------------#	
#path url UpdateThingsToWorkers
${URL_UPDATETHINGSTOWORKERS}    /api/v1/Workers/WorkerId/Thing/Assign
${URL_UPDATETHINGSTOWORKERS_NOWORKERID}    /api/v1/Workers/Thing/Assign

#header UpdateThingsToWorkers
${HEADER_X_AIS_ORDERREF_UPDATETHINGSTOWORKERS}    UpdateThingsToWorkers_
${HEADER_X_AIS_ORDERREF_UPDATETHINGSTOWORKERS_FAIL}    UpdateThingsToWorkersfail_
${HEADER_X_AIS_ORDERDESC_UPDATETHINGSTOWORKERS}    UpdateThingsToWorkers

#response description
${VALUE_DESCRIPTION_UPDATETHINGSTOWORKERS_SUCCESS}    The requested operation was successfully.

#request name
${UPDATETHINGSTOWORKERS}    UpdateThingsToWorkers
${UPDATETHINGSTOWORKERS2}    UpdateThingsToWorkers2

#-------------------------------------------- DeleteThingsFromWorker --------------------------------------------#	
#path url DeleteThingsFromWorker
${URL_DELETETHINGSFROMWORKER}    /api/v1/Workers/WorkerId/Thing/Assign
${URL_DELETETHINGSFROMWORKER_NOWORKERID}    /api/v1/Workers/Thing/Assign

#header DeleteThingsFromWorker
${HEADER_X_AIS_ORDERREF_DELETETHINGSFROMWORKER}    DeleteThingsFromWorker_
${HEADER_X_AIS_ORDERREF_DELETETHINGSFROMWORKER_FAIL}    DeleteThingsFromWorkerfail_
${HEADER_X_AIS_ORDERDESC_DELETETHINGSFROMWORKER}    DeleteThingsFromWorker

#response description
${VALUE_DESCRIPTION_DELETETHINGSFROMWORKER_SUCCESS}    The requested operation was successfully.

#request name
${DELETETHINGSFROMWORKER}    DeleteThingsFromWorker
#-------------------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------Centrics---------------------------------------------------------------------------------#
#------------------------------------------------------------------ Create a Whitelist --------------------------------------------#	
#path url CreateRoute
${URL_CREATEAWHITELIST}    /api/v1/Whitelist

#header CreateRoute
${HEADER_X_AIS_ORDERREF_CREATEAWHITELIST}    CreateAWhitelist_
${HEADER_X_AIS_ORDERREF_CREATEAWHITELIST_FAIL}    CreateAWhitelistfail_
${HEADER_X_AIS_ORDERDESC_CREATEAWHITELIST}    CreateAWhitelist

#response description
${VALUE_DESCRIPTION_CREATEAWHITELIST_SUCCESS}    Successfully created.
${VALUE_DESCRIPTION_CREATEAWHITELIST_SUCCESS1}    The requested operation was successfully.
#request name
${CREATEAWHITELIST}    CreateAWhitelist
${CREATEAWHITELIST_OTHERROLE}    CreateAWhitelistOtherRoute

${OWNERTYPE_CUSTOMER}    Customer    
${OWNERTYPE_TENANT}    Tenant  
${OWNERTYPE_ACCOUNT}    Account  
${OWNERTYPE_INVALID}    Invalid
${ROUTESTATUS}    Enabled
${ROUTEQUEUESTATUS}    Enabled
#------------------------------------------------------------------ Returns a List Of Whitelist --------------------------------------------#	
#path url ReturnsALitsOfWhitelist
${URL_RETURNSALISTOFWHITELIST}    /api/v1/Whitelist

#header CreateRoute
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWHITELIST}    ReturnsALitsOfWhitelist_
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFWHITELIST_FAIL}    ReturnsALitsOfWhitelistfail_
${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFWHITELIST}    ReturnsALitsOfWhitelist

#response description
${VALUE_DESCRIPTION_RETURNSALISTOFWHITELIST_SUCCESS}    The requested operation was successfully.

#request name
${RETURNSALISTOFWHITELIST}    ReturnsALitsOfWhitelist
${RETURNSALISTOFWHITELIST_OTHERROLE}    ReturnsALitsOfWhitelistOtherRoute
#----------------------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------ Update a Whitelist --------------------------------------------#	
#path url UpdateAWhitelist
${URL_UPDATEAWHITELIST}    /api/v1/Owners/[OwnersId]/Whitelist

${URL_UPDATEAWHITELIST_MISSINGOWNERID}    /api/v1/Owners/Whitelist

#header UpdateAWhitelist
${HEADER_X_AIS_ORDERREF_UPDATEAWHITELIST}    UpdateAWhitelist_
${HEADER_X_AIS_ORDERREF_UPDATEAWHITELIST_FAIL}    UpdateAWhitelistfail_
${HEADER_X_AIS_ORDERDESC_UPDATEAWHITELIST}    UpdateAWhitelist

#response description
${VALUE_DESCRIPTION_UPDATEAWHITELIST_SUCCESS}    The requested operation was successfully.

#request name
${UPDATEAWHITELIST}    UpdateAWhitelist

#------------------------------------------------------------------ Get a Whitelist by ThingIdentifier --------------------------------------------#	
#path url Get a Whitelist by ThingIdentifier
${URL_GETAWHITELISTBYTHINGIDENTIFIER}    /api/v1/ThingIdentifier/[ThingIdentifier]/Whitelist

${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}    /api/v1/ThingIdentifier/Whitelist

${URL_GETAWHITELISTBYTHINGIDENTIFIER_NOTFOUND}    /api/v1/ThingIdentifier/8966034816783110556/Whitelist

#header CreateRoute
${HEADER_X_AIS_ORDERREF_GETAWHITELISTBYTHINGIDENTIFIER}    GetAWhitelistbyThingIdentifier_
${HEADER_X_AIS_ORDERREF_GETAWHITELISTBYTHINGIDENTIFIER_FAIL}    GetAWhitelistbyThingIdentifierfail_
${HEADER_X_AIS_ORDERDESC_GETAWHITELISTBYTHINGIDENTIFIER}    GetAWhitelistbyThingIdentifier

#response description
${VALUE_DESCRIPTION_GETAWHITELISTBYTHINGIDENTIFIER_SUCCESS}    The requested operation was successfully.

#request name
${GETAWHITELISTBYTHINGIDENTIFIER}    GetAWhitelistbyThingIdentifier
#----------------------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------ Delete a Whitelist --------------------------------------------#	
#path url DeleteAWhitelist
${URL_DELETEAWHITELIST}    /api/v1/Owners/[OwnerId]/Whitelist

${URL_DELETEAWHITELIST_MISSINGOWNERID}    /api/v1/Owners/Whitelist

#header DeleteAWhitelist
${HEADER_X_AIS_ORDERREF_DELETEAWHITELIST}    DeleteWhitelist_
${HEADER_X_AIS_ORDERREF_DELETEAWHITELIST_FAIL}    DeleteWhitelistfail_
${HEADER_X_AIS_ORDERDESC_DELETEAWHITELIST}    DeleteWhitelist

#response description
${VALUE_DESCRIPTION_DELETEAWHITELIST_SUCCESS}    The requested operation was successfully.

#request name
${DELETEAWHITELIST}    DeleteAWhitelist


#------------------------------------------------------------------ Verifies Things --------------------------------------------#	
#path url VerifiesThings
${URL_VERIFIESTHINGS}    /api/v1/Capability/Worker/[WorkerID]/Thing/Verifies

${URL_VERIFIESTHINGS_MISSINGWORKERID}    /api/v1/Capability/Worker/Thing/Verifies


#header VerifiesThings
${HEADER_X_AIS_ORDERREF_VERIFIESTHINGS}    VerifiesThings_
${HEADER_X_AIS_ORDERREF_VERIFIESTHINGS_FAIL}    VerifiesThingsfail_
${HEADER_X_AIS_ORDERDESC_VERIFIESTHINGS}    VerifiesThings

#response description
${VALUE_DESCRIPTION_VERIFIESTHINGS_SUCCESS}    Available

#request name
${VERIFIESTHINGS}    VerifiesThings
${VERIFIESTHINGS2DATA}    VerifiesThings2Data
${VERIFIESTHINGSNOTDELETEWORKER}    VerifiesThingsNoteDeleteWorker


#------------------------------------------------------------------ Activate Things --------------------------------------------#	
#path url ActivateThings
${URL_ACTIVATETHINGS}    /api/v1/Capability/Worker/[WorkerID]/Thing/Activates

#header ActivateThings
${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS}    ActivateThings_
${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS_FAIL}    ActivateThingsfail_
${HEADER_X_AIS_ORDERDESC_ACTIVATETHINGS}    ActivateThings

#response description
${VALUE_DESCRIPTION_ACTIVATETHINGS_SUCCESS}    The requested operation was successfully.

#request name
${ACTIVATETHINGS}    ActivateThings
${ACTIVATETHINGS2DATA}    ActivateThings2Data
${ACTIVATETHINGSNOTDELETEWORKER}    ActivateThingsNotDeleteWorker


#------------------------------------------------------------------ Terminates Things --------------------------------------------#	
#path url TerminatesThings
${URL_TERMINATESTHINGS}    /api/v1/Capability/Worker/[WorkerID]/Thing/Terminates

${URL_TERMINATESTHINGS_MISSINGWORKERID}    /api/v1/Capability/Worker/Thing/Terminates

#header TerminatesThings
${HEADER_X_AIS_ORDERREF_TERMINATESTHINGS}    TerminatesThings_
${HEADER_X_AIS_ORDERREF_TERMINATESTHINGS_FAIL}    TerminatesThingsfail_
${HEADER_X_AIS_ORDERDESC_TERMINATESTHINGS}    TerminatesThings

#response description
${VALUE_DESCRIPTION_TERMINATESTHINGS_SUCCESS}    The requested operation was successfully.

#request name
${TERMINATESTHINGS}    TerminatesThings
${TERMINATESTHINGS2DATA}    TerminatesThings2Data
${TERMINATESTHINGSNOTDELETEWORKER}    TerminatesThingsNotDeleteWorker
${TERMINATESTHINGSDELETEWORKERONLY}    TerminatesThingsDeleteWorkerOnly


#------------------------------------------------------------------ Returns a list of Things Things --------------------------------------------#	
#path url ReturnsAListofThings
${URL_RETURNSALISTOFTHINGS}    /api/v1/Capability/Worker/[WorkerID]/Thing

#path url ReturnsAListofThings
${RETURNSALISTOFTHINGS_FILLTER}    ?%24Top=1&%24OrderBy=CreatedDatetime%20DESC

#path url ReturnsAListofThings
${RETURNSALISTOFTHINGS_FILLTERBYTHINGIDENTIFIER}    ?%24Filter=ThingIdentifier%20eq%20'[ThingIdentifier2]'



#header ReturnsAListofThings
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFTHINGS}    ReturnsAListofThings_
${HEADER_X_AIS_ORDERREF_RETURNSALISTOFTHINGS_FAIL}    ReturnsAListofThingsfail_
${HEADER_X_AIS_ORDERDESC_RETURNSALISTOFTHINGS}    ReturnsAListofThings

#response description
${VALUE_DESCRIPTION_RETURNSALISTOFTHINGS_SUCCESS}    The requested operation was successfully.

#request name
${RETURNSALISTOFTHINGS}    ReturnsAListofThings
${RETURNSALISTOFTHINGS2DATA}    ReturnsAListofThings2Data
${RETURNSALISTOFTHINGSNOTDELETEWORKER}    ReturnsAListofThingsNotDeleteWorker







#-------------------------------------------- Other --------------------------------------------#	

#response description
${VALUE_DESCRIPTION_THEREQUESTEDOPERATIONWASSUCCESSFULLY}    The requested operation was successfully.

#Other field
${FIELD_CREATEDATETIME}    CreatedDatetime
${FIELD_LASTUPDATETINESTAMP}    LastUpdatedTimestamp
${FIELD_OPERATIONSTATUS}    OperationStatus
${FIELD_CODE}    Code
${FIELD_DESCRIPTION}    Description
${FIELD_ACCESSTOKEN}    AccessToken    
${FIELD_PARTNERINFO}    PartnerInfo
${FIELD_PARTNERINFO_LOWWERCASE}    partnerInfo   
${FIELD_PARTNERID}    PartnerId  
${FIELD_PARTNERNAME}    PartnerName
${FIELD_ACCOUNTINFO}    AccountInfo  
${FIELD_ACCOUNTNAME}    AccountName  
${FIELD_ACCOUNTID}    AccountId  
${FIELD_ACCOUNTCODE}    AccountCode 
${FIELD_THINGINFO}    ThingInfo  
${FIELD_THINGID}    ThingId 
${FIELD_THINGIDENTIFIER}    ThingIdentifier  
${FIELD_THINGSECRET}    ThingSecret  
${FIELD_IMSI}    IMSI  
${FIELD_IMEI}    IMEI
${FIELD_THINGTOKEN}    ThingToken   
${FIELD_CONFIGGROUPINFO}    ConfigGroupInfo   
${FIELD_CONFIGGROUPID}    ConfigGroupId   
${FIELD_WORKERSINFO}    WorkersInfo 
${FIELD_WORKERID}    WorkerId 
${FIELD_SERVERPROPERTIES}    ServerProperties
${FIELD_SERVERIP}    ServerIP
${FIELD_SERVERPORT}    ServerPort
${FIELD_SERVERDOMAIN}    ServerDomain
${FIELD_WORKERSTATE}    WorkerState
${FIELD_WORKERNAME}    WorkerName
${FIELD_ACTIVATETHING}    ActivateThing
${FIELD_GROUPINFO}    GroupInfo  
${FIELD_GROUPID}    GroupId 
${FIELD_BACKUPDATAINFO}    BackupDataInfo 
${FIELD_PULLMESSAGEID}    PullMessageId 
${FIELD_ROUTEINFO}    RouteInfo
${FIELD_ROUTEID}    RouteId 
${FIELD_ROUTENAME}    RouteName
${FIELD_PURCHASEINFO}    PurchaseInfo 
${FIELD_CUSTOMERID}    CustomerId
${FIELD_SYSTEMUSERINFO}    SystemUserInfo
${FIELD_HEADER}    header

${FIELD_ICCIDPRE}    896603
${FIELD_ICCIDPRE_INVALID}    896600
${ACCOUNTID_NULL}    Null
${ACESSTOKEN_NULL}    Null
${ACCOUNTKEY_INVALID}    xx

#use flow create thing
${FIELD_CONNECTIVITYTYPE}    ConnectivityType
${FIELD_THINGNAME}    ThingName
${FIELD_CUSTOMDETAILS}    CustomDetails
${FIELD_SUPPLIERDETAILS}    SupplierDetail
${FIELD_SUPPLIERID}    SupplierId
${FIELD_SUPPLIERNAME}    SupplierName
${FIELD_THINGSTATE}    ThingState 
${FIELD_DETAILS}    Details 
#used flow ActivateThing and TransferThings for Crate WhiteList
${TYPE_CUSTOMER}    Customer 
${TYPE_TENANT}    Tenant 
${TYPE_ACCOUNT}    Account 

#used for Remove
${PARTNERACCOUNTATHING}    PartnerAccountAThing
${PARTNERACCOUNTATHINGARRAY}    PartnerAccountAThingArray
${WORKER}    Worker
${THINHG}    Thing
