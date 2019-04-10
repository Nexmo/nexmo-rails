# Nexmo Rails Gem

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
* [dotenv](https://github.com/bkeepers/dotenv)
* To use the Nexmo APIs, you [need an account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=nexmo-rails)

## Installation

To install the Nexmo Rails gem, add it, along with `dotenv-rails`, to your project's Gemfile:

```ruby

gem 'nexmo_rails'
gem 'dotenv-rails'

```

The `dotenv-rails` gem assists with environment variable management and utilization. 

Then, run `bundle install` from the command line.

## Usage

The Nexmo Rails gem will initialize a new instance of the Nexmo client inside your Rails application and make it globally accessible. To make this happen, first add the desired Nexmo credentials to your `.env` file. For example, if you are using only the `API_KEY` and `API_SECRET`, then add the following:

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

To initialize your global Nexmo client in your application, run the following from your terminal:

```console

rails generate nexmo_initializer

```

This will create a `./config/initializers/nexmo.rb` file in your application that will make the variable `Nexmo` available across your application, which contains your fully credentialed Nexmo client.

At this point, you can access any of the Nexmo APIs by simply referring to `Nexmo` in your code. For example, instead of first initializing a Nexmo client with your credentials to send an SMS, all you need to do is add the following to your application:

```ruby

Nexmo.sms.send(from: 'YOUR_NUMBER', to: 'NUMBER', text: 'Hello world')

```

More information on the Nexmo Ruby client library and how to use it with the Nexmo APIs can be found [here](https://github.com/Nexmo/nexmo-ruby).

## License

This project is under the [MIT License](LICENSE).