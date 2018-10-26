require 'ostruct'

RSpec.describe Ubw::ResultSet do

  let(:result_set_resource) do
    { resultCount: 3,
      items: [
        # Just to demo Item could be anything...
        { show: 'Killing Eve', rating: 9 },
        { show: 'The Great British Bake-Off', rating: 7 },
        { show: 'The Cry', rating: 7 }
      ]
    }
  end

  let(:item_class) { OpenStruct }

  let(:result_set) { Ubw::ResultSet.new(result_set_resource, item_class) }

  describe '#initialize' do

    it 'accepts a ResultSet resource and an item class' do
      expect { result_set }.to_not raise_error
    end

  end

  describe '#result_count' do

    it 'has a result_count' do
      expect(result_set.result_count).to eq(3)
    end

  end

  describe '#items' do

    it 'is an Array of "item_class" elements' do
      expect(result_set.items).to be_kind_of Array
      expect(result_set.items).to all(be_a(item_class))
    end

  end

  describe 'Enumerability' do

    it 'is enumerable' do
      expect(result_set).to be_a Enumerable
    end

    describe '#each' do

      context 'when no block is provided' do

        it 'returns an Enumerator' do
          expect(result_set.each).to be_a Enumerator
        end

      end

      context 'when a block is provided' do

        it 'yields successive items from #items' do
          result_set.each do |item|
            expect(item).to be_a item_class
          end
        end

      end

    end

  end

end
