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
    
    credentials = OSTSdk::Util::APICredentials.new('api_key', '2e3ec863fdffcc4425a3d73878e685e702b42bf8')
    
    obj = OSTSdk::Saas::TransactionKind.new(environment, credentials)
    
    obj.list(clientId: '1')
    
    obj.create(client_id: '1', name: 'test_1', kind: '1', value_currency_type: '1')

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ost-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
