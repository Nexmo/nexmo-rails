require 'rails/all'

class VonageInitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "This generator creates a Vonage initializer file at config/initializers and makes a configured Vonage client globally available"

    def create_vonage_initializer
      if Rails.application.credentials.vonage
        return credentials_initializer
      end

      env_initializer
    end

    private

    def credentials_initializer
      initializer "vonage.rb" do <<~HEREDOC
        Vonage.setup do |config|
          config.api_key = Rails.application.credentials.vonage[:api_key]
          config.api_secret = Rails.application.credentials.vonage[:api_secret]
          config.signature_secret = Rails.application.credentials.vonage[:api_signature]
          config.application_id = Rails.application.credentials.vonage[:application_id]
          config.private_key = Rails.application.credentials.vonage[:private_key]
        end
        HEREDOC
      end
    end

    def env_initializer
      initializer "vonage.rb" do <<~HEREDOC
        Vonage.setup do |config|
          config.api_key = ENV['VONAGE_API_KEY']
          config.api_secret = ENV['VONAGE_API_SECRET']
          config.signature_secret = ENV['VONAGE_API_SIGNATURE']
          config.application_id = ENV['VONAGE_APPLICATION_ID']
          config.private_key = ENV['VONAGE_PRIVATE_KEY']
        end
        HEREDOC
      end
    end
end
