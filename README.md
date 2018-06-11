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
ost_users_object = ost_sdk.services.users
```

Create a new user:

```ruby
ost_users_object.create(name: 'Alice').to_json
```

Edit an existing user:

```ruby
ost_users_object.edit(id: 'e55feef0-26e6-438a-9f1a-f348ce2e3c44', name: 'Bob').to_json
```

Get an existing user:

```ruby
ost_users_object.get(id: 'e55feef0-26e6-438a-9f1a-f348ce2e3c44').to_json
```

Get a list of users and other data:

```ruby
ost_users_object.list({page_no: 1, limit: 5}).to_json
```

### Airdrops Module 

```ruby
ost_airdrop_object = ost_sdk.services.airdrops
```

Execute Airdrop:

```ruby
ost_airdrop_object.execute({amount: 1, user_ids: 'e55feef0-26e6-438a-9f1a-f348ce2e3c44'}).to_json
```

Get Airdrop Status:
```ruby
ost_airdrop_object.get({id: 'ecd9b0b2-a0f4-422c-95a4-f25f8fc88334'}).to_json
```

List Airdrop
```ruby
ost_airdrop_object.list({page_no: 1, limit: 50, current_status: 'processing,complete'}).to_json
```


### Token Module 

```ruby
ost_token_object = ost_sdk.services.token
```

Get details:

```ruby
ost_token_object.get({}).to_json
```

### Actions Module 


```ruby
ost_action_object = ost_sdk.services.actions
```

Create a new action:

```ruby
ost_action_object.create({name: 'Test', kind: 'user_to_user', currency: 'USD', arbitrary_amount: false, amount: 1.01, 
                          arbitrary_commission: true}).to_json
```

Edit an action:

```ruby
ost_action_object.edit({id: 1234, amount: 2}).to_json
```

Get an action:

```ruby
ost_action_object.get(id: 1234).to_json
```

List actions:

```ruby
ost_action_object.list(page_no: 1).to_json
```

### Transaction Module 

```ruby
ost_transaction_object = ost_sdk.services.transactions
```

Execute Transaction:

```ruby
ost_transaction_object.execute({from_user_id:'f87346e4-61f6-4d55-8cb8-234c65437b01', to_user_id:'c07bd853-e893-4400-b7e8-c358cfa05d85', action_id:'20145'}).to_json
```

Get Transaction Status:
```ruby
ost_transaction_object.get({id: '0ab712ec-dc41-4e31-ac31-c93bc148bbb9'}).to_json
```

List Transactions
```ruby
ost_transaction_object.list({page_no: 1, limit: 50}).to_json
```

### Transfer Module 

```ruby
ost_transfer_object = ost_sdk.services.transfers
```

Execute Transfer:

```ruby
ost_transfer_object.execute({to_address:'0xd2b789293674faEE51bEb2d0338d15401dEbfdE3', amount:1}).to_json
```

Get Transfer Status:
```ruby
ost_transfer_object.get({id: 'd0589dc5-d0a0-4996-b9f8-847295fd2c3b'}).to_json
```

List Transfers
```ruby
ost_transfer_object.list().to_json
```

### Balances Module 

```ruby
ost_balance_object = ost_sdk.services.balances
```

Get balance of user:
```ruby
ost_balance_object.get({id: 'd0589dc5-d0a0-4996-b9f8-847295fd2c3b'}).to_json
```

### Request Specs

To obtain request/API specification, pass in `true` for the optional `api_spec` parameter when initializing SDK object:

```ruby
ost_sdk = OSTSdk::Saas::Services.new({api_key: <api_key>, api_secret: <api_secret>, api_base_url: <api_base_url>, api_spec: true})
ost_action_object = ost_sdk.services.actions
```

And then call a method:

```ruby
ost_action_object.list().to_json
 {:success=>true, :data=>{:request_uri=>"https://playground2api.stagingost.com/v1/actions/", :request_type=>"GET", :request_params=>"request_timestamp=1526541627&signature=410f6fef1ab2ad34e74caef589a15b56490b63a316fc46509d31bb133bf11678&api_key=7cad25e082390a90114e"}} 
 ```