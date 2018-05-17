# Ost::Sdk::Ruby

A Ruby wrapper for the [OST Developers API](https://dev.ost.com/).

## Requirements

To use this gem, developers will need to:
1. Sign-up on [https://kit.ost.com](https://kit.ost.com).
2. Launch a branded token economy with the OST KIT Economy Planner.
3. Obtain an API Key and API Secret from [https://kit.ost.com/developer-api-console](https://kit.ost.com/developer-api-console).

## Documentation

[https://dev.ost.com/](https://dev.ost.com/docs/0.9.1/simpletoken.html/)

## Installation

Install OST Ruby SDK

```bash
> gem install ost-sdk-ruby
```

## Example Usage

Require the OST Ruby SDK:

```ruby
require('ost-sdk-ruby')
```

Set variables for initializing SDK objects:

```ruby
ost_sdk = OSTSdk::Saas::Services.new({api_key: <api_key>, api_secret: <api_secret>, api_base_url: <api_base_url>})
```

### Transaction Kind Module 


```ruby
ost_transaction_object = ost_sdk.manifest.transaction_kind
```

Create new transaction kinds:

```ruby
ost_transaction_object.create(name: 'Like', kind: 'user_to_user', currency_type: 'usd', currency_value: '1.25', commission_percent: '12').to_json
```

```ruby
ost_transaction_object.create(name: 'Grant', kind: 'user_to_user', currency_type: 'bt', currency_value: '12', commission_percent: '0').to_json
```

```ruby
ost_transaction_object.create(name: 'Buy', kind: 'user_to_company', currency_type: 'bt', currency_value: '100').to_json
```

Get a list of existing transaction kinds and other data:

```ruby
ost_transaction_object.list().to_json
```

Edit an existing transaction kind:

```ruby
ost_transaction_object.edit(client_transaction_id: '22598', name: 'New Transaction Kind').to_json
```

Execute a branded token transfer by transaction kind:

```ruby
ost_transaction_object.execute(from_uuid: 'aeb9e7e3-a054-4883-a005-0bd8c4f0df7a', to_uuid: '53d906b3-ce0c-4798-8aa7-b1352daab757', transaction_kind: 'Upvote').to_json
```

Get the status of an executed transaction:
  
```ruby
ost_transaction_object.status(transaction_uuids: ['b6f099a3-2a65-431e-b3ec-54056d7d81eb']).to_json
```

### Users Module

```ruby
ost_users_object = ost_sdk.manifest.users
```

Create a new user:

```ruby
ost_users_object.create(name: 'Alice').to_json
```

Get a list of users and other data:

```ruby
ost_users_object.list().to_json
```

Edit an existing user:

```ruby
ost_users_object.edit(uuid: 'ab1aa227-0545-4d7a-9921-abe9d9c34146', name: 'BobTheBuilder').to_json
```

Airdrop branded tokens to users:

```ruby
ost_users_object.airdrop_tokens(amount: 1, list_type: 'never_airdropped').to_json
```

As airdropping tokens is an asynchronous task, you can check the airdrop's status:

```ruby
ost_users_object.get_airdrop_status(airdrop_uuid: 'd2b8714d-cc2e-46ba-beca-313de32d0280').to_json
```

### Request Specs

To obtain request/API specification, pass in `true` for the optional `api_spec` parameter when initializing a `TransactionKind` or `Users` module object:

```ruby
ost_sdk = OSTSdk::Saas::Services.new({api_key: <api_key>, api_secret: <api_secret>, api_base_url: <api_base_url>})
ost_transaction_object = ost_sdk.manifest.transaction_kind
```

And then call a method:

```ruby
ost_transaction_object.list().to_json
 {:success=>true, :data=>{:request_uri=>"https://playground2api.stagingost.com/transaction-types/list", :request_type=>"GET", :request_params=>"request_timestamp=1526540175&signature=6c2819714cd184fbb3ff5f495724bea3737679074055a5c90698d6a317515323&api_key=7cad25e082390a90114e"}} 
 ```