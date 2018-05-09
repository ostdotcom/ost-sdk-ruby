# Ost::Sdk::Ruby

A Ruby wrapper for the [OST Developers API](https://dev.ost.com/).

## Requirements

To use this gem, developers will need to:
1. Sign-up on [https://kit.ost.com](https://kit.ost.com).
2. Launch a branded token economy with the OST KIT Economy Planner.
3. Obtain an API Key and API Secret from [https://kit.ost.com/developer-api-console](https://kit.ost.com/developer-api-console).

## Documentation

[https://dev.ost.com/](https://dev.ost.com/)

## Installation

Install OST Ruby SDK

```bash
> gem install ost-sdk-ruby -v 0.9.3
```

## Example Usage

Require the OST Ruby SDK:

```ruby
require('ost-sdk-ruby')
```

Set variables for initializing SDK objects:

```ruby
environment = 'sandbox'
credentials = OSTSdk::Util::APICredentials.new(<api_key>, <api_secret>)
```

### Transaction Kind Module 

Initialize a `TransactionKind` object to perform transaction-related actions:

```ruby
ostTransactionKindObject = OSTSdk::Saas::TransactionKind.new(environment, credentials)
```

Create new transaction kinds:

```ruby
ostTransactionKindObject.create(name: 'Like', kind: 'user_to_user', currency_type: 'usd', currency_value: '1.25', commission_percent: '12')
```

```ruby
ostTransactionKindObject.create(name: 'Grant', kind: 'company_to_user', currency_type: 'bt', currency_value: '12', commission_percent: '0')
```

```ruby
ostTransactionKindObject.create(name: 'Buy', kind: 'user_to_company', currency_type: 'bt', currency_value: '100', commission_percent: '0')
```

Get a list of existing transaction kinds and other data:

```ruby
ostTransactionKindObject.list()
```

Edit an existing transaction kind:

```ruby
ostTransactionKindObject.edit(client_transaction_id: '12', name: 'New Transaction Kind')
```

Execute a branded token transfer by transaction kind:

```ruby
ostTransactionKindObject.execute(from_uuid: '1234-1928-1081dsds-djhksjd', to_uuid: '1234-1928-1081-1223232', transaction_kind: 'Purchase')
```

Get the status of an executed transaction:
  
```ruby
ostTransactionKindObject.status(transaction_uuids: ['5f79063f-e22a-4d28-99d7-dd095f02c72e'])
```

### Users Module

Initialize a `Users` object to perform user specific actions:

```ruby
ostUsersObject = OSTSdk::Saas::Users.new(environment, credentials)
```

Create a new user:

```ruby
ostUsersObject.create(name: 'Alice')
```

Get a list of users and other data:

```ruby
ostUsersObject.list()
```

Edit an existing user:

```ruby
ostUsersObject.edit(uuid: '1234-1928-1081dsds-djhksjd', name: 'Bob')
```

Airdrop branded tokens to users:

```ruby
ostUsersObject.airdrop_tokens(amount: 100, list_type: 'all')
```

As airdropping tokens is an asynchronous task, you can check the airdrop's status:

```ruby
ostUsersObject.get_airdrop_status(airdrop_uuid: '1234-1928-1081dsds-djhksjd')
```

### Airdrops Module 

```ruby
ost_airdrop_object = ost_sdk.manifest.users
```

Execute Airdrop:

```ruby
ost_airdrop_object.airdrop_tokens({amount: 1, list_type: 'all'})
```

Get Airdrop Status:
```ruby
ost_airdrop_object.get({id: 'ecd9b0b2-a0f4-422c-95a4-f25f8fc88334'})
```

### Request Specs

To obtain request/API specification, pass in `true` for the optional `api_spec` parameter when initializing a `TransactionKind` or `Users` module object:

```ruby
ostTransactionKindObject = OSTSdk::Saas::TransactionKind.new(environment, credentials, true)
```

And then call a method:

```ruby
> ostTransactionKindObject.list()
=> #<OSTSdk::Util::Result:0x007ffccab36c98 @error=nil, @error_message=nil, @error_data=nil, @error_display_text=nil, @error_display_heading=nil, @message=nil, @http_code=200, @data={:request_uri=>"https://sandboxapi.ost.com/transaction-types/list", :request_type=>"GET", :request_params=>"request_timestamp=<request_epoch_timestamp>&signature=<signature>&api_key=<api_key>"}>
```
