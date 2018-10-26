RSpec.describe Ubw::Client do
  it "has a version number" do
    expect(Ubw::Client::VERSION).not_to be nil
  end

  describe 'Ubw::Client#site' do

    it 'is initially nil' do
      expect(Ubw::Client.site).to be_nil
    end

    it 'is settable' do
      site = 'http://ubw.service'
      Ubw::Client.site = site
      expect(Ubw::Client.site).to eql(site)
    end

  end

  describe 'Ubw::Client#connection' do

    it 'yields an instance of Faraday::Connection' do
      expect { |b| Ubw::Client.connection({}, &b) }.to yield_with_args(Faraday::Connection)
    end

    it 'is an instance of Ubw::Connection' do
      expect(Ubw::Client.connection).to be_instance_of(Ubw::Connection)
    end

  end
end
