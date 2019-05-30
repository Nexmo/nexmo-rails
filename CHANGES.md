# 0.3.0

* Fixed compatibility issue with Nexmo Ruby Client library and now passing in a hash to initialize a new instance
* Renamed `api_signature` to `signature_secret` in `nexmo_initializer_generator.rb` to conform to naming in Nexmo Ruby Client library
<br>
(NOTE: **This is a breaking change**. Upon upgrading to 0.3.0, it is recommended to rerun the initializer.)

# 0.2.0

* Added support for account, alerts, conversions, files and pricing Client methods 

# 0.1.0

* Introduced support for Credentials in addition to environment variables

# 0.1.0

* First version!