require 'vagas_service_connection/version'
require 'faraday'
require 'faraday_middleware'

require 'typhoeus'
require 'typhoeus/adapters/faraday'

module VagasServiceConnection
  ##
  # Classe para manter uma conexão permanente com um serviço do Vagas. Utiliza
  # o faraday e o typhoeus por de baixo dos panos e só sabe trabalhar com json
  class Connection < SimpleDelegator
    attr_reader :config

    def initialize(config)
      @config = config

      super(faraday_connection)
    end

    private

    def faraday_opts
      { url: config[:url],
        headers: { 'Content-Type' => 'application/json' } }
    end

    def faraday_connection
      @connection ||= Faraday.new(faraday_opts) do |c|
        c.request :json
        c.adapter :typhoeus
        c.response :json, content_type: /\bjson$/
      end
    end
  end
end
