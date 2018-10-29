module Ubw
  module Queries
    module Where
      module ClassMethods
        # params are a Hash where each value can be a String or an Array
        # params keys should be snake_cased but get changed to camelCase
        #
        # e.g. where(cost_code: "S0001", module_name: ["WGS", "Library Prep"])
        def where(params)
          formatted_params = params.keys.each_with_object({}) do |key, obj|
            value = params[key].is_a?(Array) ? params[key].join(',') : params[key]
            obj[Ubw::Util.camelify(key).to_sym] = value
            obj
          end

          response = Ubw::Client.connection.get(endpoint, formatted_params)

          Ubw::ResultSet.new(response.body, self)
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end
    end
  end
end
