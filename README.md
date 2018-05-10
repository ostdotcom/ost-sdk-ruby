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

### Users Module 

```ruby
ost_users_object = ost_sdk.manifest.users
```

Create a new user:

```ruby
ost_users_object.create(name: 'Alice')
```

Edit an existing user:

```ruby
ost_users_object.edit(id: '1234-1928-1081dsds-djhksjd', name: 'Bob')
```

Get an existing user:

```ruby
ost_users_object.get(id: '1234-1928-1081dsds-djhksjd')
```

Get a list of users and other data:

```ruby
ost_users_object.list()
```

### Airdrops Module 

```ruby
ost_airdrop_object = ost_sdk.manifest.airdrops
```

Execute Airdrop:

```ruby
ost_airdrop_object.execute({amount: 1, airdropped: 'true', user_ids: 'f87346e4-61f6-4d55-8cb8-234c65437b01'})
```

Get Airdrop Status:
```ruby
ost_airdrop_object.get({id: 'ecd9b0b2-a0f4-422c-95a4-f25f8fc88334'})
```

List Airdrop
```ruby
ost_airdrop_object.list({page_no: 1, limit: 50, current_status: 'processing,complete'})
```


### Token Module 

```ruby
ost_token_object = ost_sdk.manifest.token
```

Get details:

```ruby
ost_token_object.get({})
```

### Actions Module 


```ruby
ost_token_object = ost_sdk.manifest.actions
```

Create a new action:

```ruby
ost_token_object.create({}) 
```

Edit an action:

```ruby
ost_token_object.edit({})
```

Get an action:

```ruby
ost_token_object.get(id: 1234)
```

List actions:

```ruby
ost_token_object.list()
```