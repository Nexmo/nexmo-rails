require 'nexmo'
require 'forwardable'

module Nexmo
  class << self
    extend Forwardable

    attr_accessor :client

    def_delegators :@client, :sms, :tfa, :calls, :verify,
                   :number_insight, :applications, :numbers,
                   :secrets, :redact, :signature

    def setup
      self.client = ::Nexmo::Client.new do |config|
        yield config
      end
    end
  end
end
