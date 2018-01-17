# Ost::Sdk::Ruby

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'ost-sdk-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ost-sdk-ruby

## Usage

1. TransactionKind Module 

    environment = 'sandbox' # possible values sandbox / production
    
    credentials = OSTSdk::Util::APICredentials.new('api_key', 'api_secret')
    
    obj = OSTSdk::Saas::TransactionKind.new(environment, credentials)
    
    obj.list
    
    obj.create()

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ost-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
