Vonage.setup do |config|
  config.api_key = ENV['VONAGE_API_KEY']
  config.api_secret = ENV['VONAGE_API_SECRET']
  config.signature_secret = ENV['VONAGE_API_SIGNATURE']
  config.application_id = ENV['VONAGE_APPLICATION_ID']
  config.private_key = ENV['VONAGE_PRIVATE_KEY']
end
