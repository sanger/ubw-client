RSpec.describe Ubw::Util do

  describe 'Ubw::Util#snakify' do

    it 'converts a string to snake_case' do
      expect(Ubw::Util.snakify('costCode')).to eq('cost_code')
      expect(Ubw::Util.snakify('cost_code')).to eq('cost_code')
      expect(Ubw::Util.snakify('subCostCode')).to eq('sub_cost_code')
      expect(Ubw::Util.snakify('ChimpApeZoo')).to eq('chimp_ape_zoo')
    end

  end

  describe 'Ubw::Util#camelify' do

    it 'converts a snakey_string to camelCase' do
      expect(Ubw::Util.camelify('cost_code')).to eq('costCode')
      expect(Ubw::Util.camelify('sub_cost_code')).to eq('subCostCode')
      expect(Ubw::Util.camelify('chimp_ape_zoo')).to eq('chimpApeZoo')
    end

  end

end