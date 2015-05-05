require 'json_http_connection/version'
require 'faraday'
require 'faraday_middleware'

require 'typhoeus'
require 'typhoeus/adapters/faraday'

module JsonHttpConnection
  ##
  # Permanent connection to a JSON HTTP Service using faraday and typhoeus
  class Connection < SimpleDelegator
    attr_reader :config

    def initialize(config)
      @config = config

      super(faraday_connection)
    end

    private

    def faraday_opts
      {
        url: config[:url],
        headers: {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        }
      }
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
