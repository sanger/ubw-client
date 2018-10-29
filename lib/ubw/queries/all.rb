module Ubw
  module Queries
    module All
      module ClassMethods
        def all
          response = Ubw::Client.connection.get(endpoint)
          Ubw::ResultSet.new(response.body, self)
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end
