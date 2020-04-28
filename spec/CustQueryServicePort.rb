require 'savon'



#  IP021 - PORTALES WEB COTIZACIÓN
#  -------------------------------

# cliente Cust Query Service Port
# ===============================

cliente = Savon.client do
    wsdl 'https://ws.uy.sura.dev.ctplc.ltd:9074/insiswsext/CustQueryServicePort?WSDL' 
    wsse_auth("insis_gen_v10", "insis_gen_v10")
    ssl_verify_mode :none
    convert_request_keys_to :camelcase
  end

  puts cliente.operations

#  Método get_policy_detail
#  ------------------------

#los parametos de entrada son opcionales, entiendo que es uno u el otro
responseRoles = cliente.call(:list_available_products, message: {Username: 'insis_gen_v10', QuoteID: ''})

puts responseQuoteID.body


#  Método list_available_products
#  ------------------------------

responseRoles = cliente.call(:list_available_products, message: {PagePaginator: {
                                                                            StartFrom: '1', 
                                                                            OffSet: '100'},
                                                                Username: 'insis_gen_v10'
                                                                }
                                )
 
puts responseRoles.body


#  Método get_agent_hierarchy
#  --------------------------

responseJeraquia = cliente.call(:get_agent_hierarchy, message: {PagePaginator: {
                                                                            StartFrom: '1', 
                                                                            OffSet: '100'},
                                                                Username: 'insis_gen_v10',
                                                                AgentNo: ''
                                                                }
                                )

puts responseJeraquia.body


#  Método get_conf_product
#  -----------------------

responseProductConf = cliente.call(:get_conf_product, message: {PagePaginator: {
                                                                            StartFrom: '1', 
                                                                            OffSet: '100'},
                                                                Username: 'insis_gen_v10',
                                                                ProductCode: '4010'
                                                                }
                                )

puts responseProductConf.body


#  Método get_header_policy
#  ------------------------

responsePolicyHeader = cliente.call(:get_header_policy, message: {PagePaginator: {
                                                                            StartFrom: '1', 
                                                                            OffSet: '100'},
                                                                QuotationId: '', # opcional
                                                                PolicyId: '', # opcional
                                                                AgentsUser: '', # opcional
                                                                StartDate: '', 
                                                                EndDate: '',
                                                                ProductCode: '', # opcional
                                                                PackageId: '', # opcional
                                                                CustomState: '', # opcional 
                                                                CustomStateAux: ''# opcional
                                                                }
                                )

puts responsePolicyHeader.body


#  Método get_person_detail
#  ------------------------

responsePersonDetail = cliente.call(:get_person_detail, message: {PagePaginator: {
                                                                            StartFrom: '1', 
                                                                            OffSet: '100'},
                                                                FirstName: '', # opcional
                                                                LastName1: '', # opcional
                                                                LastName2: '', # opcional
                                                                PID: '', # opcional 
                                                                DocumentType: '', # opcional 
                                                                DocumentNumber: '', # opcional
                                                                ManID: '', # opcional
                                                                Roles: ''
                                                                }
                                )

puts responsePersonDetail.body


#  Método GetReport
#  ----------------

responseReport= cliente.call(:get_report, message: {
                                                                EntityType: '',
                                                                SubEntityType: '',
                                                                DocEntityID: '',
                                                                DocProcess: '', 
                                                                DocProduct: '',
                                                                DocSubProcess: '',
                                                                DocID: '', # opcional
                                                                Username: '',
                                                                BinaryFormat: '', # opcional
                                                                GenerateIfNotFound: '',
                                                                AutoSaveIfNotFound: ''
                                                                }
                                )

puts responseReport.body


#  Método get_roles
#  ----------------

responseRoles= cliente.call(:get_roles, message: {
                                                  Username: '',
                                                  AgentNo: ''
                                                  }
                                )

puts responseRoles.body


