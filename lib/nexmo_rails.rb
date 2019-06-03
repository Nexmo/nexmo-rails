require 'nexmo'
require 'forwardable'

module Nexmo
  class << self
    extend Forwardable

    attr_accessor :client

    def_delegators :@client, :account, :alerts, :applications, :calls,
                   :conversations, :conversions, :files, :messages, 
                   :numbers, :number_insight, :pricing, :redact, 
                   :secrets, :sms, :signature, :tfa, :verify
                   
    def setup
      self.client = ::Nexmo::Client.new do |config|
        yield config
      end
    end
  end
end
