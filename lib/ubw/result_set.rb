module Ubw
  # Represents a collection of resources e.g. UBW::Price
  class ResultSet
    include Enumerable

    attr_reader :result_count, :items

    def initialize(result_set, item_class)
      @result_count = result_set.fetch(:resultCount)
      @items = create_items(result_set.fetch(:items), item_class)
    end

    def each
      return items.each unless block_given?
      items.each { |item| yield item }
    end

    private

    def create_items(result_set_items, item_class)
      result_set_items.map { |item| item_class.new(item) }
    end

  end
end