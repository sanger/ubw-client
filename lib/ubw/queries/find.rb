module Ubw
  module Queries
    module Find
      module ClassMethods
        def find(id)
          response = Ubw::Client.connection.get("#{endpoint}/#{id}")
          new(response.body)
        end

      end
      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end
