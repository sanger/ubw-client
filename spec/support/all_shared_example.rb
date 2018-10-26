RSpec.shared_examples "all" do

  let(:result_set_resource) do
    { resultCount: 2,
      items: [
        { writer: 'Lin Manuel' },
        { protaganist: 'Alexander Hamilton' }
      ]
    }
  end

  it 'returns a Ubw::ResultSet' do
    expect_any_instance_of(Ubw::Connection).to receive(:get)
      .with(described_class.endpoint)
      .and_return(result_set_resource)

    result = described_class.all

    expect(result).to be_instance_of(Ubw::ResultSet)
    expect(result.items).to all be_instance_of(described_class)
  end

end