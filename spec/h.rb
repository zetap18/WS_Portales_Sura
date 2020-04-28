require 'savon'

client = Savon.client do
  wsdl 'https://ws.uy.sura.dev.ctplc.ltd:9074/insiswsext/CustQueryServicePort?WSDL'
  ssl_verify_mode :none
  soap_header(
  "wsse:Security" => {
    "@xmlns:wsse" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd",
    "@xmlns:wsu" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd",
    "@soapenv:mustUnderstand" => "1",
    "wsse:UsernameToken" => {
      "@wsu:Id" => "UsernameToken-A9C61314BEFA249B19157842473917810",
      "wsse:Username" => "insis_gen_v10",
      "wsse:Password" => "insis_gen_v10"
    }}
  )
  env_namespace :soapenv
  convert_request_keys_to :camelcase
end


puts client.operations
    puts client.build_request(:list_available_products, message:
      {'Username' => 'insis_gen_v10' ,  'PagePaginator' => {'StartFrom' => '1', 'OffSet' => '1000'}}).body

      puts client.call(:list_available_products, message:
        {'Username' => 'insis_gen_v10' ,  'PagePaginator' => {'StartFrom' => '1', 'OffSet' => '1000'}})





