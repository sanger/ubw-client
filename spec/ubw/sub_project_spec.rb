RSpec.describe Ubw::SubProject do
  include_examples "find"
  include_examples "where"
  include_examples "all"

  let(:sub_project_resource) { { subCostCode: "S0002-001", costCode: "S0002", status: 'N', isActive: true } }
  let(:sub_project) { Ubw::SubProject.new(sub_project_resource) }

  describe 'Ubw::SubProject#endpoint' do

    it 'is subprojects' do
      expect(Ubw::SubProject.endpoint).to eq('/subprojects')
    end

  end

  describe '#initialize' do

    it 'accepts a SubProject resource' do
      expect { sub_project }.to_not raise_error
    end

  end

  describe 'attributes' do

    it 'has a sub_cost_code' do
      expect(sub_project.sub_cost_code).to eq(sub_project_resource[:subCostCode])
    end

    it 'has a cost_code' do
      expect(sub_project.cost_code).to eq(sub_project_resource[:costCode])
    end

    it 'has a status' do
      expect(sub_project.status).to eq(sub_project_resource[:status])
    end

    it 'has is_active?' do
      expect(sub_project.is_active?).to eq(sub_project_resource[:isActive])
    end

  end
end
