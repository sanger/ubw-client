module Ubw
  module Queries
    module Where
      module ClassMethods

        # params are a Hash where each value can be a String or an Array
        # params keys should be snake_cased but get changed to camelCase
        #
        # e.g. where(cost_code: "S0001", module_name: ["WGS", "Library Prep"])
        def where(params)
          formatted_params = params.keys.reduce({}) do |memo, key|
            value = params[key].kind_of?(Array) ? params[key].join(',') : params[key]
            memo[Ubw::Util.camelify(key).to_sym] = value
            memo
          end

          Ubw::ResultSet.new(Ubw::Client.connection.get(endpoint, formatted_params), self)
        end

      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end