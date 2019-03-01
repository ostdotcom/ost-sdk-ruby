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
# The config field is optional
ost_sdk = OSTSdk::Saas::Services.new({api_key: <api_key>, api_secret: <api_secret>, api_base_url: <api_base_url>, config: {timeout: <timeout_in_seconds>}})
```

### Balance Module 

```ruby
balance_service = ost_sdk.services.balance
```

Get Balance of user:

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = balance_service.get(getParams)
```

### Chains Module 

```ruby
chains_service = ost_sdk.services.chains
```

Get 

```ruby
getParams = {}
getParams[:chain_id] = '2000'
response = chains_service.get(getParams)
```

### Device Managers Module 

```ruby
device_managers_service = ost_sdk.services.device_managers
```

Get 

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = device_managers_service.get(getParams)
```

### Devices Module 

```ruby
devices_service = ost_sdk.services.devices
```

Create a device for User:

```ruby
createParams = {}
createParams[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
createParams[:address] = '0x1Ea365269A3e6c8fa492eca9A531BFaC8bA1649E'
createParams[:api_signer_address] = '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
createParams[:device_uuid] = '593a967f-87bd-49a6-976c-52edf46c4df4'
createParams[:device_name] = 'Iphone S'
response = devices_service.create(createParams)

```

Get User Device(s) List:

```ruby
getParams = {}
getParams[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
response = devices_service.get_list(getParams)

```

Get User Device:

```ruby
getParams = {}
getParams[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
getParams[:device_address] = '0x1Ea365269A3e6c8fa492eca9A531BFaC8bA1649E'
response = devices_service.get(getParams)

```

### Price Points Module 

```ruby
price_points_service = ost_sdk.services.price_points
```

Get 

```ruby
getParams = {}
getParams[:chain_id] = '2000'
response = price_points_service.get(getParams)

```

### Recovery Owners Module 

```ruby
recovery_owners_service = ost_sdk.services.recovery_owners
```

Get 

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
getParams[:recovery_owner_address] = '0x...'
response = recovery_owners_service.get(getParams)

```

### Rules Module 

```ruby
rules_service = ost_sdk.services.rules
```

Get 

```ruby
getParams = {}
response = rules_service.get_list(getParams)
```

### Session Module

```ruby
sessions_service = ost_sdk.services.sessions
```

Get User Session:

```ruby
getParams = {}
getParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
getParams[:session_address] = '0x...'
response = sessions_service.get(getParams)
```

Get User Session(s) List:

```ruby
getParams = {}
getParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
response = sessions_service.get_list(getParams)
```

### Tokens Module 

```ruby
tokens_service = ost_sdk.services.tokens
```

Get Token Detail:

```ruby
getParams = {}
response = tokens_service.get(getParams)
```

### Transactions Module 

```ruby
transactions_service = ost_sdk.services.transactions
```

Execute transaction:

```ruby
executeParams = {}
executeParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
response = transactions_service.execute(executeParams)
```

Get transaction detail:

```ruby
executeParams = {}
executeParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
executeParams[:transaction_id] = 't43g990c-32wa-ff3r-n553-9f1ew2t32rt1'
response = transactions_service.get(executeParams)
```

List transactions of a user:

```ruby
executeParams = {}
executeParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
response = transactions_service.get_list(executeParams)
```

### Users Module 

```ruby
users_service = ost_sdk.services.users
```

Create User:

```ruby
createParams = {}
response = users_service.create(createParams)
```

Get User Detail:

```ruby
getParams = {}
getParams[:id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = users_service.get(getParams)

```

Get User List:

```ruby
getParams = {}
response = users_service.get_list(getParams)

```

### Request Specs

To obtain request/API specification, pass in `true` for the optional `api_spec` parameter when initializing SDK object:

```ruby
ost_sdk = OSTSdk::Saas::Services.new({api_key: <api_key>, api_secret: <api_secret>, api_base_url: <api_base_url>, api_spec: true})
tokens_service = ost_sdk.services.tokens
```

And then call a method:

```ruby
tokens_service.get(getParams)
{:request_uri=>"https://s5-api.stagingost.com/testnet/v2/tokens", :request_type=>"GET", :request_params=>"api_key=2de530542a37b1bb7c6d36efd21997ad&api_request_timestamp=1550499761&api_signature_kind=OST1-HMAC-SHA256&api_signature=2c13637d4b39cf0fb5034b73fb8335ec7bdce948ce0eaf6923f9f29cef8693bf"}
``` 