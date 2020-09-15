require 'vonage'
require 'forwardable'

module Vonage
  class << self
    extend Forwardable

    attr_accessor :client

    def_delegators :@client, :account, :alerts, :applications, 
                   :voice, :conversations, :conversions,
                   :files, :messages, :numbers,
                   :number_insight, :pricing, :redact, :secrets,
                   :sms, :signature, :tfa, :verify
                   
    def setup(&block)
      config = OpenStruct.new 
      config.instance_eval(&block)
      self.client = ::Vonage::Client.new(
        api_key: config.api_key,
        api_secret: config.api_secret,
        signature_secret: config.signature_secret,
        application_id: config.application_id,
        private_key: config.private_key.present? && File.exist?(config.private_key) ? File.read(config.private_key) : config.private_key
      )
    end
  end
end
