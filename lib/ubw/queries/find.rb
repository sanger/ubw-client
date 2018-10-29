module Ubw
  module Queries
    module Find
      module ClassMethods
        def find(id)
          new(Ubw::Client.connection.get("#{endpoint}/#{id}"))
        end

      end
      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end
