RSpec.shared_examples "where" do

  let(:result_set_resource) do
    { resultCount: 3,
      items: [
        { sister: 'Angelica' },
        { sister: 'Eliza' },
        { sister: 'Peggy' }
      ]
    }
  end

  it 'converts param keys to camelCase' do
    expect_any_instance_of(Ubw::Connection).to receive(:get)
      .with("#{described_class.endpoint}", { costCode: 'S1234', subCostCode: 'S1234-100' })
      .and_return(result_set_resource)

    described_class.where(cost_code: 'S1234', sub_cost_code: 'S1234-100')
  end

  it 'converts param values that are Arrays to a String' do
    expect_any_instance_of(Ubw::Connection).to receive(:get)
      .with("#{described_class.endpoint}", { costCode: 'S1234,S5678,S9012' })
      .and_return(result_set_resource)

    described_class.where(cost_code: ['S1234', 'S5678', 'S9012'])
  end

  it 'returns a Ubw::ResultSet' do
    allow_any_instance_of(Ubw::Connection).to receive(:get)
      .and_return(result_set_resource)

    result = described_class.where(cost_code: 'S1234')

    expect(result).to be_instance_of(Ubw::ResultSet)
    expect(result.items).to all be_instance_of(described_class)
  end

end