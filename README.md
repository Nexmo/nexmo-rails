# Vonage Rails Gem

[![Gem Version](https://badge.fury.io/rb/vonage_rails.svg)](https://badge.fury.io/rb/vonage_rails) [![Coverage Status](https://coveralls.io/repos/github/Nexmo/nexmo-rails/badge.svg?branch=master)](https://coveralls.io/github/Nexmo/nexmo-rails?branch=master) [![Build Status](https://api.travis-ci.org/Nexmo/nexmo-rails.svg?branch=master)](https://travis-ci.org/Nexmo/nexmo-rails)

<img src="https://developer.nexmo.com/assets/images/Vonage_Nexmo.svg" height="48px" alt="Nexmo is now known as Vonage" />

This is the Vonage Rails Gem for Vonage APIs. To use it you'll
need a Vonage account. Sign up [for free at vonage.com](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=nexmo-rails).

* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [License](#license)

## Requirements

Vonage Rails requires: 

* Rails 5.2+
* Ruby 2.5.3+
* To use the Vonage APIs, you [need an account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=nexmo-rails)

## Installation

To install the Vonage Rails gem add it to your project's Gemfile:

```ruby

gem 'vonage_rails'

```

Then, run `bundle install` from the command line.

## Usage

The Vonage Rails gem will initialize a new instance of the Vonage client inside your Rails application and make it globally accessible. To make this happen, you must supply it with your Vonage API credentials. You can do so either as environemnt variables or as part of your Rails credentials.

### With Environment Variables 

To add your Vonage API credentials as environment variables, first add the desired Vonage credentials to your `.env` file. For example, if you are using only the `API_KEY` and `API_SECRET`, then add the following:

```

VONAGE_API_KEY = your_api_key
VONAGE_API_SECRET = your_api_secret

```

If you are also using a `SIGNATURE`, `APPLICATION_ID` and/or a `PRIVATE_KEY`, then add them as appropriate to your `.env` file:

```

VONAGE_API_SIGNATURE = your_signature
VONAGE_PRIVATE_KEY = your_private_key_file_path
VONAGE_APPLICATION_ID = your_application_id

```

Make sure you have the `dotenv-rails` Gem installed in your application and that your `.env` file is included in `.gitignore` so as not to commit your credentials to version control. 

### With Rails Credentials

To add your Vonage API credentials to your Rails Credentials, go ahead and open your encrypted credentials file with the following command:

```console

$ EDITOR="code --wait" rails credentials:edit

```

You can replace the `EDITOR` variable with your preferred editor. Once the credentials file is open, you are able to add the Vonage credentials with the following namespacing:

```yaml

vonage:
    api_key:
    api_secret:

```

You may add any of the Vonage API credentials your application needs nested within the `vonage:` namespace.

### Running the Initializer

To initialize your global Vonage client in your application, run the following from your terminal:

```console

$ rails generate vonage_initializer

```

This will create a `./config/initializers/vonage.rb` file in your application that will make the variable `Vonage` available across your application, which contains your fully credentialed Vonage client.

At this point, you can access any of the Vonage APIs by simply referring to `Vonage` in your code. For example, instead of first initializing a Vonage client with your credentials to send an SMS, all you need to do is add the following to your application:

```ruby

Vonage.sms.send(from: 'YOUR_NUMBER', to: 'NUMBER', text: 'Hello world')

```

More information on the Vonage Ruby Server SDK and how to use it with the Vonage APIs can be found [here](https://github.com/Vonage/vonage-ruby-sdk).

## License

This project is under the [MIT License](LICENSE).
