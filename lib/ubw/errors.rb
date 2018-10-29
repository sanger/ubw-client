# Lovingly stolen from https://github.com/sanger/aker-materials-client-gem/blob/master/lib/matcon_client/errors.rb
module Ubw
  module Errors
    class ApiError < StandardError
      attr_reader :env
      def initialize(env)
        @env = env
      end
    end

    class ClientError < ApiError
    end

    class AccessDenied < ClientError
    end

    class NotAuthorized < ClientError
    end

    class UnprocessableEntity < ClientError
    end

    class BadRequest < ClientError
    end

    class ConnectionError < ApiError
    end

    class ServerError < ApiError
      def message
        'Internal server error'
      end
    end

    class Conflict < ServerError
      def message
        'Resource already exists'
      end
    end

    class NotFound < ServerError
      attr_reader :uri

      def initialize(uri)
        @uri = uri
      end

      def message
        "Couldn't find resource at: #{uri}"
      end
    end

    class UnexpectedStatus < ServerError
      attr_reader :code, :uri

      def initialize(code, uri)
        @code = code
        @uri = uri
      end

      def message
        "Unexpected response status: #{code} from: #{uri}"
      end
    end
  end
end
