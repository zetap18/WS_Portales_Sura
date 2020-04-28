require 'savon'



#  IP021 - PORTALES WEB COTIZACIÓN
#  -------------------------------

# cliente Cust Content Service Port
# =================================


cliente = Savon.client do
    wsdl 'https://ws.uy.sura.dev.ctplc.ltd:9074/insiswsext/CustContentServicePort?WSDL' 
    wsse_auth("insis_gen_v10", "insis_gen_v10")
    ssl_verify_mode :none
    convert_request_keys_to :camelcase
  end
  
  puts cliente.operations
  
  
#  Método list_documents
#  ---------------------
  
responseListDocs = cliente.call(:list_documents, message: {
                                                                    docEntityID: '', # opcional
                                                                    entityType: '', # opcional
                                                                    subEntityType: '', # opcional
                                                                    docName: '', # opcional 
                                                                    docType: '',
                                                                    product: '', # opcional
                                                                    process: '', # opcional
                                                                    subprocess: '', # opcional 
                                                                    fromDate: '', # opcional
                                                                    toDate: ''
                                                                    }
                                    )

puts responseListDocs.body



#  Método add_documents
#  ---------------------
  
responseAddtDocs = cliente.call(:add_documents, message: {
                                                        docEntityID: '', # opcional
                                                        entityType: '', # opcional
                                                        subEntityType: '', # opcional
                                                        docName: '', # opcional 
                                                        docType: '',
                                                        product: '', # opcional
                                                        process: '', # opcional
                                                        subprocess: '', # opcional 
                                                        fileContent: '',
                                                        creationDate: ''
                                                        }
                                )

puts responseAddtDocs.body



#  Método get_documents
#  ---------------------

responseGetDocs = cliente.call(:get_documents, message: {IdDocumento: ''})

puts responseGetDocs.body

