module Ubw
  module Queries
    module All
      module ClassMethods
        def all
          Ubw::ResultSet.new(Ubw::Client.connection.get(endpoint), self)
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end
