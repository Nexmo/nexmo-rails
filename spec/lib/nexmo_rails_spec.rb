require 'spec_helper'
require_relative '../../lib/nexmo_rails'

describe Nexmo do
  describe '.setup' do

    before do
      described_class.setup do |config|
        config.api_key           = 'NEXMO_API_KEY'
        config.api_secret        = 'NEXMO_API_SECRET'
        config.signature_secret  = 'NEXMO_API_SIGNATURE'
        config.application_id    = 'NEXMO_APPLICATION_ID'
        config.private_key       = 'NEXMO_PRIVATE_KEY'
      end
    end

    it 'sets up the client' do
      client = described_class.client

      expect(client).to be_an_instance_of(::Nexmo::Client)
      expect(client.api_key).to eq('NEXMO_API_KEY')
      expect(client.api_secret).to eq('NEXMO_API_SECRET')
      expect(client.signature_secret).to eq('NEXMO_API_SIGNATURE')
      expect(client.application_id).to eq('NEXMO_APPLICATION_ID')
      expect(client.private_key).to eq('NEXMO_PRIVATE_KEY')
    end
  end
end

