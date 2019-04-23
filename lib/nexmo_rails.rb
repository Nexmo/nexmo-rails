require 'nexmo'

module Nexmo
  class << self
    attr_accessor :client

    def setup
      self.client = ::Nexmo::Client.new do |config|
        yield config
      end
    end
  end
end
