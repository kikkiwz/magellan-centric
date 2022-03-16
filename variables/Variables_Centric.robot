*** Variables ***
#-------------------------------------------- Start ENV Master --------------------------------------------#
#STAGING	
# ${URL_GET_LOG}    https://mg-staging.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# applicationName : Centric
# ${VALUE_APPLICATIONNAME_CENTRIC}    Magellan.Centric.APIs

#IOT
${URL_GET_LOG}    https://mg-iot.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# applicationName : Centric
${VALUE_APPLICATIONNAME_CENTRIC}    Magellan.Centric.APIs


#-------------------------------------------- Data Provisioning SignIn   --------------------------------------------#
#IOT
#RootAdmin
${SIGNIN_USERNAME_ROOTADMIN}    QA_SC
${SIGNIN_PASSOWORD_ROOTADMIN}    VGVzdDEyMzQ=
#SupplierAdmin
${SIGNIN_USERNAME_SUPPLIERADMIN}    sctest_supplierddmin
${SIGNIN_PASSOWORD_SUPPLIERADMIN}    dGVzdDEyMzQ=
#CustomerAdmin
${SIGNIN_USERNAME_CUSTOMERADMIN}    sctest_customeradmin
${SIGNIN_PASSOWORD_CUSTOMERADMIN}    dGVzdDEyMzQ=
#Supplier
${SIGNIN_USERNAME_SUPPLIER}    sctest_supplier
${SIGNIN_PASSOWORD_SUPPLIER}    dGVzdDEyMzQ=
#Customer
${SIGNIN_USERNAME_CUSTOMER}    sctest_customer
${SIGNIN_PASSOWORD_CUSTOMER}    dGVzdDEyMzQ=

#-------------------------------------------- Data Centric   --------------------------------------------#
#-------------------------------------------- Worker   --------------------------------------------#
${VALUE_CENTRIC_GETAWORKERBYWORKERID_WORKERID_INVALID}    1111

${VALUE_CENTRIC_RETURNSALISTOFWORKER_TOPANDPAGE}    ?%24Top=1&%24Page=3

${VALUE_CENTRIC_RETURNSALISTOFWORKER_FILLTERWORKERID}    ?%24Filter=WorkerId%20eq%20%27[WorkerId]%27

${VALUE_CENTRIC_RETURNSALISTOFWORKER_FILLTERWORKERNAME}    ?%24Top=10&%24Select=WorkerName&%24OrderBy=WorkerName%20desc

${VALUE_CENTRIC_IMPORTSLISTOFTHINGBYWORKERID_WORKERID_INVALID}    test
${VALUE_CENTRIC_IMPORTSLISTOFTHINGBYWORKERID_CONNECTIVITYTYPE_INVALID}    Test
${VALUE_CENTRIC_IMPORTSLISTOFTHINGBYWORKERID_ICCIDPRE_INVALID}    896601

${VALUE_CENTRIC_EXPORTSLISTOFTHINGBYWORKERID_WORKERID_INVALID}    test
${VALUE_CENTRIC_ASSIGNTHINGSTOWORKERS_WORKERID_INVALID}    test
${VALUE_CENTRIC_UPDATETHINGSTOWORKERS_WORKERID_INVALID}    test
${VALUE_CENTRIC_DELETETHINGSFROMWORKER_WORKERID_INVALID}    test

${VALUE_CENTRIC_PARTIALUPDATE_PATH_SERVERPROPERTIES_SERVERDOMAIN_INVALID}    ServerProperties/ServerDomainx
${VALUE_CENTRIC_PARTIALUPDATE_WORKERID_INVALID}    Test
${VALUE_CENTRIC_PARTIALUPDATE_OP_INVALID}    xxx
#-------------------------------------------- Data Other   --------------------------------------------#
${VALUE_ACCOUNTID_OTHERROLE}    609b822cb7ae1f00014b82d1 
${VALUE_PARTNERID_OTHERROLE}    609b822cb7ae1f00014b82cd
${VALUE_CUSTOMERID_OTHERROLE}    609b822cb7ae1f00014b82cc
${VALUE_PARTNERNAME_OTHERROLE}    SC918365

${VALUE_ACCESSTOKENEXPIRE}    ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBx4jWgDSdjc43yKZfEzo4Tys7tfqpFLnOlKVegMrc8SMg==