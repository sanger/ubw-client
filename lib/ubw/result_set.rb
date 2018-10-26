module Ubw
  # Represents a collection of resources e.g. UBW::Price
  class ResultSet
    include Enumerable

    attr_reader :result_count, :items

    def initialize(result_set, item_class)
      @result_count = result_set.fetch(:resultCount)
      @items        = result_set.fetch(:items).map { |item| item_class.new(item) }
    end

    def each
      return items.each unless block_given?
      items.each { |item| yield item }
    end

  end
end