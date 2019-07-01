# Nexmo Rails Gem

[![Gem Version](https://badge.fury.io/rb/nexmo_rails.svg)](https://badge.fury.io/rb/nexmo_rails) [![Coverage Status](https://coveralls.io/repos/github/Nexmo/nexmo-rails/badge.svg?branch=master)](https://coveralls.io/github/Nexmo/nexmo-rails?branch=master) [![Build Status](https://api.travis-ci.org/Nexmo/nexmo-ruby.svg?branch=master)](https://travis-ci.org/Nexmo/nexmo-ruby)

This is the Nexmo Rails Gem for Nexmo's API. To use it you'll
need a Nexmo account. Sign up [for free at nexmo.com](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=nexmo-rails).

* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [License](#license)

## Requirements

Nexmo Rails requires: 

* Rails 5.2+
* Ruby 2.5.3+
* To use the Nexmo APIs, you [need an account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=nexmo-rails)

## Installation

To install the Nexmo Rails gem add it to your project's Gemfile:

```ruby

gem 'nexmo_rails'

```

Then, run `bundle install` from the command line.

## Usage

The Nexmo Rails gem will initialize a new instance of the Nexmo client inside your Rails application and make it globally accessible. To make this happen, you must supply it with your Nexmo API credentials. You can do so either as environemnt variables or as part of your Rails credentials.

### With Environment Variables 

To add your Nexmo API credentials as environment variables, first add the desired Nexmo credentials to your `.env` file. For example, if you are using only the `API_KEY` and `API_SECRET`, then add the following:

```

NEXMO_API_KEY = your_api_key
NEXMO_API_SECRET = your_api_secret

```

If you are also using a `SIGNATURE`, `APPLICATION_ID` and/or a `PRIVATE_KEY`, then add them as appropriate to your `.env` file:

```

NEXMO_API_SIGNATURE = your_signature
NEXMO_PRIVATE_KEY = your_private_key_file_path
NEXMO_APPLICATION_ID = your_application_id

```

Make sure you have the `dotenv-rails` Gem installed in your application and that your `.env` file is included in `.gitignore` so as not to commit your credentials to version control. 

### With Rails Credentials

To add your Nexmo API credentials to your Rails Credentials, go ahead and open your encrypted credentials file with the following command:

```console

$ EDITOR="code --wait" rails credentials:edit

```

You can replace the `EDITOR` variable with your preferred editor. Once the credentials file is open, you are able to add the Nexmo credentials with the following namespacing:

```yaml

nexmo:
    api_key:
    api_secret:

```

You may add any of the Nexmo API credentials your application needs nested within the `nexmo:` namespace.

### Running the Initializer

To initialize your global Nexmo client in your application, run the following from your terminal:

```console

$ rails generate nexmo_initializer

```

This will create a `./config/initializers/nexmo.rb` file in your application that will make the variable `Nexmo` available across your application, which contains your fully credentialed Nexmo client.

At this point, you can access any of the Nexmo APIs by simply referring to `Nexmo` in your code. For example, instead of first initializing a Nexmo client with your credentials to send an SMS, all you need to do is add the following to your application:

```ruby

Nexmo.sms.send(from: 'YOUR_NUMBER', to: 'NUMBER', text: 'Hello world')

```

More information on the Nexmo Ruby client library and how to use it with the Nexmo APIs can be found [here](https://github.com/Nexmo/nexmo-ruby).

## License

This project is under the [MIT License](LICENSE).
