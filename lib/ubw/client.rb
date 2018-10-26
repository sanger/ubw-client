# Version
require "ubw/client/version"

# Connection
require "ubw/connection"
require "ubw/middleware/status"

# Util
require "ubw/util"

# Queries
require "ubw/queries/find"
require "ubw/queries/where"
require "ubw/queries/all"

# Resources
require "ubw/resource"
require "ubw/price"
require "ubw/sub_project"
require "ubw/result_set"

# Errors
require "ubw/errors"

module Ubw
  module Client

    @site = ENV['UBW_SITE']

    class << self
      attr_accessor :site

      def connection(params = {})
        @connection ||= Ubw::Connection.new(params.merge(url: site)) do |connection|
          yield connection if block_given?
        end
      end
    end
  end
end
