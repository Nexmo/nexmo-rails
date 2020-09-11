require 'spec_helper'
require 'rails_helper'
require_relative '../../lib/vonage_rails'

describe Vonage do
  describe '.setup' do

    before do
      described_class.setup do |config|
        config.api_key           = 'VONAGE_API_KEY'
        config.api_secret        = 'VONAGE_API_SECRET'
        config.signature_secret  = 'VONAGE_API_SIGNATURE'
        config.application_id    = 'VONAGE_APPLICATION_ID'
        config.private_key       = 'VONAGE_PRIVATE_KEY'
      end
    end

    it 'sets up the config' do
      client = described_class.client

      expect(client).to be_an_instance_of(::Vonage::Client)
      expect(client.config.api_key).to eq('VONAGE_API_KEY')
      expect(client.config.api_secret).to eq('VONAGE_API_SECRET')
      expect(client.config.signature_secret).to eq('VONAGE_API_SIGNATURE')
      expect(client.config.application_id).to eq('VONAGE_APPLICATION_ID')
      expect(client.config.private_key).to eq('VONAGE_PRIVATE_KEY')
    end
  end

  describe 'private key initialization with file path defined' do

    before do 
      allow(File).to receive(:exists?).and_return(true)
      described_class.setup do |config|
        config.api_key           = 'VONAGE_API_KEY'
        config.api_secret        = 'VONAGE_API_SECRET'
        config.signature_secret  = 'VONAGE_API_SIGNATURE'
        config.application_id    = 'VONAGE_APPLICATION_ID'
        config.private_key       = './private.key'
      end
    end

    it 'uses file path for private key when it is present' do
      client = described_class.client

      expect(client.config.private_key).to eq('./private.key')
    end
  end

  describe 'private key initialization with no key defined' do

    before do 
      described_class.setup do |config|
        config.api_key           = 'VONAGE_API_KEY'
        config.api_secret        = 'VONAGE_API_SECRET'
        config.signature_secret  = 'VONAGE_API_SIGNATURE'
        config.application_id    = 'VONAGE_APPLICATION_ID'
        config.private_key       = ''
      end
    end

    it 'does not define a private key if one is not given' do
      client = described_class.client

      expect(client.config.private_key).to be_blank
    end
  end
end

