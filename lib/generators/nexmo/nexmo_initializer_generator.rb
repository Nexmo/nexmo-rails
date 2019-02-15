require 'rails/generators'
class NexmoInitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "This generator creates a Nexmo initializer file at config/initializers and makes a configured Nexmo client globally available"

    def create_nexmo_initializer
      initializer "nexmo.rb" do 
        "::Nexmo = Nexmo::Client.new do |config|\n
          config.api_key = ENV['NEXMO_API_KEY'],\n
          config.api_secret = ENV['NEXMO_API_SECRET'],\n
          config.api_signature = ENV['NEXMO_API_SIGNATURE'],\n
          config.application_id = ENV['NEXMO_APPLICATION_ID'],\n
          config.private_key = ENV['NEXMO_PRIVATE_KEY']\n
        end"
      end
    end
end