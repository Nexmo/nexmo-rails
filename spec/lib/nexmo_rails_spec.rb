require_relative '../../lib/nexmo_rails'
require 'spec_helper'

describe Nexmo do
  describe '.setup' do

    before do
      described_class.setup do |config|
        config.api_key        = 'NEXMO_API_KEY',
        config.api_secret     = 'NEXMO_API_SECRET',
        config.api_signature  = 'NEXMO_API_SIGNATURE',
        config.application_id = 'NEXMO_APPLICATION_ID',
        config.private_key    = 'NEXMO_PRIVATE_KEY'
      end
    end

    it 'sets up the client' do
      expect(described_class.client).to be_an_instance_of(::Nexmo::Client)
    end
  end
end
