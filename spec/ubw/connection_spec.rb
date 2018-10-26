RSpec.describe Ubw::Connection do

  let(:connection_args) { { url: 'https://ubw.service' } }
  let(:connection) { Ubw::Connection.new(connection_args) }

  describe '#initialize' do

    it 'yields an instance of Faraday::Connection' do
      expect { |b| Ubw::Connection.new(connection_args, &b) }.to yield_with_args(Faraday::Connection)
    end

  end

  describe '#get' do

    let(:faraday) { double('Faraday') }

    before :each do
      allow(connection).to receive(:faraday).and_return(faraday)
    end

    it 'delegates to faraday' do
      expect(faraday).to receive(:get).with('/monkeys?awesome=true')
      connection.get('/monkeys?awesome=true')
    end

  end

end
