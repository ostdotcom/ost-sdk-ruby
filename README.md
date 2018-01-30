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
    
    credentials = OSTSdk::Util::APICredentials.new('2fb1cd4ff54f8d842805', '018215e8eeda1084ebcf1fefb5b702799a2d52d0cda955209d98e65bd55a69e0')
    
    obj = OSTSdk::Saas::TransactionKind.new(environment, credentials)
    
    obj.list()
    
    obj.create(name: 'test_1', kind: 'user_to_user', value_currency_type: 'usd', value_in_usd: '1.1', value_in_bt: '1.1', commission_percent: '0.0')

    obj.edit(client_transaction_id: '12', name: 'test_1_1_1')
    
2. On Boarding Module

    obj = OSTSdk::Saas::Addresses.new(environment, credentials)

    obj.create(passphrase: 'testtest')
    
## Contributing

1. Fork it ( https://github.com/[my-github-username]/ost-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
