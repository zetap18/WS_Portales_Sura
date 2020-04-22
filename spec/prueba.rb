require 'savon'

cliente = Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsultimocierre?WSDL')

puts cliente.operations

response = cliente.call(:execute)

puts response.body

puts response.body.keys

puts response.body[:wsultimocierre_execute_response][:salida][:fecha]



cliente1 = Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsbcumonedas?WSDL')

puts cliente1.operations


response1 = cliente1.call(:execute, message: {'Entrada' => {'Grupo' => '2'}})


puts response1.body



cliente2 = Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsbcucotizaciones?WSDL')

puts cliente2.operations

