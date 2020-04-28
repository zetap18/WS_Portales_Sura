require 'savon'



#  IP021 - PORTALES WEB COTIZACIÓN
#  -------------------------------

# cliente Cust Content Service Port
# =================================


cliente = Savon.client do
    wsdl 'https://surauydevinsisoic-oracleinsis.integration.ocp.oraclecloud.com:443/ic/ws/integration/v1/flows/soap/IP021_CREATEVERSIONEDQ/1.0/?WSDL' 
    wsse_auth("insis_gen_v10", "insis_gen_v10")
    ssl_verify_mode :none
    convert_request_keys_to :camelcase
  end
  
  puts cliente.operations