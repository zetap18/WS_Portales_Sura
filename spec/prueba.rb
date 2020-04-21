require 'savon'

cliente = Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsultimocierre?WSDL')

puts cliente.operations

response = cliente.call(:execute)

puts response.body

puts response.body.keys

puts response.body[:wsultimocierre_execute_response][:salida][:fecha]
