require 'json_http_connection'
require 'webmock/rspec'

RSpec.describe JsonHttpConnection::Connection do
  before { WebMock.disable_net_connect! }
  after  { WebMock.allow_net_connect! }

  subject(:client) { JsonHttpConnection::Connection.new(url: 'http://my.domain/') }

  it 'should execute the requests on the correct URI' do
    stub = stub_request(:get, 'http://my.domain/service.json')

    client.get '/service.json'

    expect(stub).to have_been_requested
  end

  it 'should serialize the json request body' do
    stub = stub_request(:post, 'http://my.domain/service.json').with(
      headers: { 'Content-Type' => 'application/json' },
      body: '{"key":"value"}')

    client.post '/service.json', key: 'value'

    expect(stub).to have_been_requested
  end

  it "shouldn't serialize if it's already a string" do
    stub = stub_request(:post, 'http://my.domain/service.json').with(
      headers: { 'Content-Type' => 'application/json' },
      body: '{"key":"value"}')

    client.post '/service.json', '{"key":"value"}'

    expect(stub).to have_been_requested
  end

  it 'should parse the response body' do
    stub = stub_request(:get, 'http://my.domain/service.json').to_return(
      body: '{"key":"value"}',
      status: 200,
      headers: { 'Content-Type' => 'application/json' })

    response = client.get '/service.json'
    expect(response.body).to eq('key' => 'value')

    expect(stub).to have_been_requested
  end
end
