# Ost::Sdk::Ruby

A Ruby wrapper for the [OST Developers API](https://dev.ost.com/).

## Requirements

To use this gem, developers will need to:
1. Sign-up on [https://kit.ost.com](https://kit.ost.com).
2. Launch a branded token economy with the OST KIT Economy Planner.
3. Obtain an API Key and API Secret from [https://kit.ost.com/mainnet/developer](https://kit.ost.com/mainnet/developer).

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
# the latest valid API endpoint is "https://api.ost.com/mainnet/v2/"
# The config field is optional
ost_sdk = OSTSdk::Saas::Services.new({api_key: <api_key>, api_secret: <api_secret>, api_base_url: <api_base_url>, config: {timeout: <timeout_in_seconds>}})
```

### Chains Module 

```ruby
chains_service = ost_sdk.services.chains
```

Get chain details:

```ruby
getParams = {}
getParams[:chain_id] = 2000
response = chains_service.get(getParams)
```

### Price Points Module 

```ruby
price_points_service = ost_sdk.services.price_points
```

Get price points of an auxiliary chain:

```ruby
getParams = {}
getParams[:chain_id] = 2000
response = price_points_service.get(getParams)
```

### Tokens Module 

```ruby
tokens_service = ost_sdk.services.tokens
```

Get Token Details:

```ruby
getParams = {}
response = tokens_service.get(getParams)
```

### Rules Module 

```ruby
rules_service = ost_sdk.services.rules
```

Get rules:

```ruby
getParams = {}
# getParams[:limit] = 10
response = rules_service.get_list(getParams)
```

### Users Module 

```ruby
users_service = ost_sdk.services.users
```

Create a new user:

```ruby
createParams = {}
response = users_service.create(createParams)
```

Get an existing user:

```ruby
getParams = {}
getParams[:id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = users_service.get(getParams)
```

Get list of users:

```ruby
getParams = {}
# getParams[:limit] = 10
response = users_service.get_list(getParams)
```

### Devices Module 

```ruby
devices_service = ost_sdk.services.devices
```

Create a new device for an existing user:

```ruby
createParams = {}
createParams[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
createParams[:address] = '0x1Ea365269A3e6c8fa492eca9A531BFaC8bA1649E'
createParams[:api_signer_address] = '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
createParams[:device_uuid] = '593a967f-87bd-49a6-976c-52edf46c4df4'
createParams[:device_name] = 'Iphone S'
response = devices_service.create(createParams)
```

Get devices of an existing user:

```ruby
getParams = {}
getParams[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
# getParams[:pagination_identifier] = "eyJsYXN0RXZhbHVhdGVkS2V5Ijp7InVpZCI6eyJTIjoiZDE5NGFhNzUtYWNkNS00ZjQwLWIzZmItZTczYTdjZjdjMGQ5In0sIndhIjp7IlMiOiIweDU4YjQxMDY0NzQ4OWI4ODYzNTliNThmZTIyMjYwZWIxOTYwN2IwZjYifX19"
# getParams[:addresses] = ["0x5906ae461eb6283cf15b0257d3206e74d83a6bd4","0xab248ef66ee49f80e75266595aa160c8c1abdd5a"]
# getParams[:limit] = 10
response = devices_service.get_list(getParams)
```

Get device of an existing user:

```ruby
getParams = {}
getParams[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
getParams[:device_address] = '0x1Ea365269A3e6c8fa492eca9A531BFaC8bA1649E'
response = devices_service.get(getParams)
```

### Device Managers Module 

```ruby
device_managers_service = ost_sdk.services.device_managers
```

Get device manager details of an exiting user:

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = device_managers_service.get(getParams)
```

### Session Module

```ruby
sessions_service = ost_sdk.services.sessions
```

Get session of an existing user:

```ruby
getParams = {}
getParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
getParams[:session_address] = '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
response = sessions_service.get(getParams)
```

Get sessions of an existing user:

```ruby
getParams = {}
getParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
# getParams[:limit] = 10
response = sessions_service.get_list(getParams)
```

### Recovery Owners Module 

```ruby
recovery_owners_service = ost_sdk.services.recovery_owners
```

Get recovery owner of an existing user:

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
getParams[:recovery_owner_address] = '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
response = recovery_owners_service.get(getParams)
```

### Balance Module 

```ruby
balance_service = ost_sdk.services.balance
```

Get token balance of an existing user:

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = balance_service.get(getParams)
```

### Transactions Module 

```ruby
transactions_service = ost_sdk.services.transactions
```

Execute company to user transaction [directTransfers method]:

```ruby
executeParams = {}
executeParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
executeParams[:to] = '0x4e9314f004026F89Fc52790c3357b2D34FBA93b0'
raw_calldata = {}
raw_calldata[:method] = "directTransfers" 
raw_calldata[:parameters] = [["0x4e9314f004026F89Fc52790c3357b2D34FBA93b0", "0xe37906219ad67cc1301b970539c9860f9ce8d991"],['1','1']] 
executeParams[:raw_calldata] = raw_calldata.to_json

meta_property = {
      name: "transaction_name" ,
      type: "user_to_user",
      details: ""
    }

# executeParams[:meta_property] = meta_property
response = transactions_service.execute(executeParams)
```

Execute company to user transaction [pay method]:

```ruby
executeParams = {}
executeParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
executeParams[:to] = '0x4e9314f004026F89Fc52790c3357b2D34FBA93b0'
raw_calldata = {}
raw_calldata[:method] = "pay" 
raw_calldata[:parameters] = ["0xa9632350057c2226c5a10418b1c3bc9acdf7e2ee", ["0x4e9314f004026F89Fc52790c3357b2D34FBA93b0", "0xe37906219ad67cc1301b970539c9860f9ce8d991"],['1','1'], "USD", "23757000000000000"] 
executeParams[:raw_calldata] = raw_calldata.to_json

meta_property = {
      name: "transaction_name" ,
      type: "user_to_user",
      details: ""
    }

# executeParams[:meta_property] = meta_property
response = transactions_service.execute(executeParams)
```

Get transaction of an exiting user:

```ruby
getParams = {}
getParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
getParams[:transaction_id] = 't43g990c-32wa-ff3r-n553-9f1ew2t32rt1'
response = transactions_service.get(getParams)
```

Get transactions of an exiting user:

```ruby
getParams = {}
getParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'

meta_property = {
      name: "transaction_name" ,
      type: "user_to_user",
      details: ""
    }
# getParams[:status] = ["CREATED", "SUBMITTED", "SUCCESS", "FAILED"]
# getParams[:meta_property] meta_property.to_json
# getParams[:limit] = 10
 
response = transactions_service.get_list(getParams)
```