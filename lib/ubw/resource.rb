require 'ostruct'

module Ubw
  # Inherit from OpenStruct so don't have to worry about field name changes
  # Good: Means gem doesn't have to change when the API does
  # Bad: Any nonsense could be passed in
  class Resource < OpenStruct

    def self.endpoint
      @endpoint
    end

    def initialize(resource = nil)
      super(format_keys(resource))
    end

  private

    # JSON resources usually have camelCase field names
    # Want the methods on our resources to be snake_case
    def format_keys(resource)
      resource.keys.reduce({}) do |memo, key|
        value = resource[key]

        formatted_key = Ubw::Util.snakify(key)
        formatted_key << '?' if !!value == value # Add a ? to the key if value is a Boolean

        memo[formatted_key] = value

        memo
      end
    end

  end
end