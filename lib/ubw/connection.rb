require 'forwardable'
require 'faraday_middleware'

module Ubw
  class Connection
    extend Forwardable

    def_delegator :faraday, :get
    attr_reader :faraday

    def initialize(options)
      # Disable retrieving proxy settings from environment variables
      Faraday.ignore_env_proxy = true

      @faraday = Faraday.new(options) do |connection|
        connection.request :json
        connection.response :json, :content_type => /\bjson$/
        connection.use Ubw::Middleware::Status

        yield connection if block_given?
        
        connection.adapter Faraday.default_adapter
      end
    end

  end
end
