require 'rails/generators'

class NexmoInitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "This generator creates a Nexmo initializer file at config/initializers and makes a configured Nexmo client globally available"

    def create_nexmo_initializer
      initializer "nexmo.rb" do <<~HEREDOC
        Nexmo.setup do |config|
          config.api_key = ENV['NEXMO_API_KEY'],
          config.api_secret = ENV['NEXMO_API_SECRET'],
          config.api_signature = ENV['NEXMO_API_SIGNATURE'],
          config.application_id = ENV['NEXMO_APPLICATION_ID'],
          config.private_key = ENV['NEXMO_PRIVATE_KEY']
        end
        HEREDOC
      end
    end
end
