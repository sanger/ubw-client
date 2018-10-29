require 'ostruct'

module Ubw
  # Inherit from OpenStruct so don't have to worry about field name changes
  # Good: Means gem doesn't have to change when the API does
  # Bad: Any nonsense could be passed in
  class Resource < OpenStruct
    class << self
      attr_reader :endpoint
    end

    def initialize(resource = nil)
      super(format_keys(resource))
    end

    private

    # JSON resources usually have camelCase field names
    # Want the methods on our resources to be snake_case
    def format_keys(resource)
      resource.keys.each_with_object({}) do |key, obj|
        value = resource[key]

        formatted_key = Ubw::Util.snakify(key)
        # Add a ? to the key if value is a Boolean
        formatted_key << '?' if !!value == value

        obj[formatted_key] = value
        obj
      end
    end
  end
end
