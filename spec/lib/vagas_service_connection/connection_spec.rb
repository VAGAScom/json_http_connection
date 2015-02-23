require 'vagas_service_connection'
require 'webmock/rspec'

RSpec.describe VagasServiceConnection::Connection do
  before { WebMock.disable_net_connect! }
  after  { WebMock.allow_net_connect! }

  subject(:client) { VagasServiceConnection::Connection.new(url: 'http://nao.existe') }

  it 'deve executar as requests no endpoint configurado' do
    stub = stub_request(:get, 'http://nao.existe/servico.json')

    client.get '/servico.json'

    expect(stub).to have_been_requested
  end

  it 'deve serializar para json se não for uma string' do
    stub = stub_request(:post, 'http://nao.existe/servico.json').with(
      headers: { 'Content-Type' => 'application/json' },
      body: '{"chave":"valor"}')

    client.post '/servico.json', chave: 'valor'

    expect(stub).to have_been_requested
  end

  it 'não precisa serializar para json se for uma string' do
    stub = stub_request(:post, 'http://nao.existe/servico.json').with(
      headers: { 'Content-Type' => 'application/json' },
      body: '{"chave":"valor"}')

    client.post '/servico.json', '{"chave":"valor"}'

    expect(stub).to have_been_requested
  end

  it 'deve parsear o json da response automaticamente' do
    stub = stub_request(:get, 'http://nao.existe/servico.json').to_return(
      body: '{"chave":"valor"}',
      status: 200,
      headers: { 'Content-Type' => 'application/json' })

    response = client.get '/servico.json'
    expect(response.body).to eq('chave' => 'valor')

    expect(stub).to have_been_requested
  end
end
