require 'spec_helper'

RSpec.describe 'BCU test fecha cierre' do
  let(:savon_client) { Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsultimocierre?WSDL')}
  let(:response) { savon_client.call(:execute) }  
  
  
  context 'fecha ultimo cierre' do
    it { expect((response.body[:wsultimocierre_execute_response][:salida][:fecha]).to_s).to eq ('2020-04-21') }
  end
end


RSpec.describe 'BCU test cotizaciones' do
  let(:savon_client1) { Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsbcucotizaciones?WSDL',convert_request_keys_to: :camelcase)}
  let(:response1) { savon_client1.call(:execute, message: {Entrada: {
                                                              FechaDesde: '2020/04/21', 
                                                              FechaHasta: '2020/04/21', 
                                                              Grupo: '2',
                                                              Moneda: {item: '2225'}, 
                                                              }
                                                          }
                                        )   
                  }  
  
  
  context 'status de la respuesta de cotizaciones' do
                                 
    it { expect((response1.body[:wsbcucotizaciones_execute_response][:salida][:respuestastatus][:status])).to eq "1" }
  end
end



RSpec.describe 'BCU test cotizaciones' do
  let(:savon_client1) { Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsbcucotizaciones?WSDL',convert_request_keys_to: :camelcase)}
  let(:response1) { savon_client1.call(:execute, message: {Entrada: {
                                                              FechaDesde: '2020/04/21', 
                                                              FechaHasta: '2020/04/21', 
                                                              Grupo: '2',
                                                              Moneda: {item: '2225'}, 
                                                              }
                                                          }
                                        )   
                  }  
  
  
  context 'status de la respuesta de cotizaciones' do
                                 
    it { expect((response1.body[:wsbcucotizaciones_execute_response][:salida][:respuestastatus][:codigoerror])).to eq "0" }
  end
end



#{:wsbcucotizaciones_execute_response=>
#                                      {:salida=>
#                                                {:respuestastatus=>
#                                                                  {:status=>"1", 
#                                                                   :codigoerror=>"0", 
#                                                                   :mensaje=>nil
#                                                                   }, 
#                                                  :datoscotizaciones=>
#                                                                    {:datoscotizaciones_dato=>
#                                                                                            {:fecha=>#<Date: 2020-04-21 ((2458961j,0s,0n),+0s,2299161j)>, 
#                                                                                            :moneda=>"2225", 
#                                                                                            :nombre=>"DLS. USA BILLETE", 
#                                                                                            :codigo_iso=>"DLS.", 
#                                                                                            :emisor=>"ESTADOS UNIDOS", 
#                                                                                            :tcc=>"43.248000", 
#                                                                                            :tcv=>"43.248000", 
#                                                                                            :arb_act=>"1.000000", 
#                                                                                            :forma_arbitrar=>"0", 
#                                                                                            :@xmlns=>"Cotiza"}}
#                                                                                            , 
#                                                                    :@xmlns=>"Cotiza"
#                                                  }, 
#                                                  :@xmlns=>"Cotiza"
#                                      }
#  }