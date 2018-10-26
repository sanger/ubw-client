RSpec.shared_examples "find" do

  let(:resource) { { unitPrice: "123.45", costCode: "S0002", status: 'N', isActive: true } }
  let(:result) { described_class.find('1234') }

  context 'when the resource is found' do

    before do
      allow_any_instance_of(Ubw::Connection).to receive(:get)
        .with("#{described_class.endpoint}/1234")
        .and_return(resource)
    end

    it "returns an instance of #{described_class}" do
      expect(result).to be_instance_of(described_class)
      expect(result.unit_price).to eq("123.45")
      expect(result.cost_code).to eq("S0002")
      expect(result.status).to eq("N")
      expect(result.is_active?).to eq(true)
    end

  end

  context 'when the resource is not found' do

    before do
      allow_any_instance_of(Ubw::Connection).to receive(:get)
        .with("#{described_class.endpoint}/1234")
        .and_raise(Ubw::Errors::NotFound, "#{described_class.endpoint}/1234")
    end

    it 'raises a Ubw::Errors::NotFound' do
      expect { result }.to raise_error(Ubw::Errors::NotFound)
    end

  end

end