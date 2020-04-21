require 'spec_helper'

RSpec.describe 'BCU test' do
  let(:savon_client) { Savon.client(wsdl:'https://cotizaciones.bcu.gub.uy/wscotizaciones/servlet/awsultimocierre?WSDL')}
  let(:response) { savon_client.call(:execute) }  
  
  context 'when the lat long exists' do
    subject { puts response.body[:wsultimocierre_execute_response][:salida][:fecha] }
    it { expect(subject).to eq 2020-04-20 }
  end
end