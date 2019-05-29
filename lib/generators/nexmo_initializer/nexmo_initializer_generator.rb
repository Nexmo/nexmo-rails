require 'rails/all'

class NexmoInitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "This generator creates a Nexmo initializer file at config/initializers and makes a configured Nexmo client globally available"

    def create_nexmo_initializer
      if Rails.application.credentials.nexmo
        return credentials_initializer
      end

      env_initializer
    end

    private

    def credentials_initializer
      initializer "nexmo.rb" do <<~HEREDOC
        Nexmo.setup do |config|
          config.api_key = Rails.application.credentials.nexmo[:api_key],
          config.api_secret = Rails.application.credentials.nexmo[:api_secret],
          config.api_signature = Rails.application.credentials.nexmo[:api_signature],
          config.application_id = Rails.application.credentials.nexmo[:application_id],
          config.private_key = Rails.application.credentials.nexmo[:private_key]
        end
        HEREDOC
      end
    end

    def env_initializer
      initializer "nexmo.rb" do <<~HEREDOC
        Nexmo.setup do |config|
          config.api_key = ENV['NEXMO_API_KEY']
          config.api_secret = ENV['NEXMO_API_SECRET']
          config.signature_secret = ENV['NEXMO_API_SIGNATURE']
          config.application_id = ENV['NEXMO_APPLICATION_ID']
          config.private_key = ENV['NEXMO_PRIVATE_KEY']
        end
        HEREDOC
      end
    end
end
