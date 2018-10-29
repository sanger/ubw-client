RSpec.describe Ubw::Price do
  include_examples "where"
  include_examples "all"

  let(:price_resource) { { costCode: 'S2623', unitPrice: '135.25', moduleName: 'Standard WGS' } }
  let(:price) { Ubw::Price.new(price_resource) }

  describe 'Ubw::Price#endpoint' do

    it 'is prices' do
      expect(Ubw::Price.endpoint).to eq('prices')
    end

  end

  describe '#initialize' do

    it 'accepts a Price resource' do
      expect { price }.to_not raise_error
    end

  end

  describe 'attributes' do

    it 'has a cost_code' do
      expect(price.cost_code).to eq(price_resource[:costCode])
    end

    it 'has a unit_price' do
      expect(price.unit_price).to eq(price_resource[:unitPrice])
    end

    it 'has a module_name' do
      expect(price.module_name).to eq(price_resource[:moduleName])
    end

  end
end
