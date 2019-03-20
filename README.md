# OST Ruby SDK
[![Build Status](https://travis-ci.org/ostdotcom/ost-sdk-ruby.svg?branch=develop)](https://travis-ci.org/ostdotcom/ost-sdk-ruby)

The official [OST](https://dev.ost.com/) Ruby SDK.

## Introduction

OST is a complete technology solution enabling mainstream businesses 
to easily launch blockchain-based economies without 
requiring blockchain development.

At the core of OST is the concept of OST-powered Brand Tokens (BTs). 
BTs are white-label cryptocurrency tokens with utility representations 
running on highly-scalable Ethereum-based side blockchains, 
backed by OST tokens staked on Ethereum mainnet. Within a business’s 
token economy, BTs can only be transferred to whitelisted user addresses. 
This ensures that they stay within the token economy.

The OST technology stack is designed to give businesses everything they need 
to integrate, test, and deploy BTs. Within the OST suite of products, developers 
can use OST Platform to create, test, and launch Brand Tokens backed by OST. 

OST APIs and server-side SDKs make it simple and easy for developers to 
integrate blockchain tokens into their apps.

## Requirements

Integrating an OST SDK into your application can begin as soon as you create an account 
with OST Platform, requiring only three steps:
1. Sign-up on [https://platform.ost.com](https://platform.ost.com).
2. Create your Brand Token in OST Platform.
3. Obtain an API Key and API Secret from [https://platform.ost.com/mainnet/developer](https://platform.ost.com/mainnet/developer).

## Documentation

[https://dev.ost.com/](https://dev.ost.com/)

## Installation

Install OST Ruby SDK

```bash
> gem install ost-sdk-ruby
```

## Getting Started

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

## SDK Modules

If a user's private key is lost, they could lose access 
to their tokens. To tackle this risk, OST promotes a 
mobile-first approach and provides mobile (client) and server SDKs. 


* The server SDKs enable you to register users with OST Platform.
* The client SDKs provide the additional support required for 
the ownership and management of Brand Tokens by users so 
that they can create keys and control their tokens. 

### Users Module 

To register users with OST Platform, you can use the services provided in the Users module. 

Initialize a Users object to perform user-specific actions, like creating users:

```ruby
users_service = ost_sdk.services.users
```

Create a User with OST Platform:

```ruby
create_params = {}
response = users_service.create(create_params)
```

Get User Detail:

```ruby
get_params = {}
get_params[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = users_service.get(get_params)
```

Get Users List:

```ruby
get_params = {}
# get_params[:ids] = ['91263ebd-6b2d-4001-b732-4024430ca758', '45673ebd-6b2d-4001-b732-4024430ca758']
# get_params[:limit] = 10
response = users_service.get_list(get_params)
```


### Devices Module 

Once a user is created via the API, you can register the 
user’s device with OST Platform. Next, activate the user’s 
wallet on the user's device. Multiple devices can be 
registered per user. 
 
Initialize a Devices object to perform device-specific actions, like registering devices:

```ruby
devices_service = ost_sdk.services.devices
```

Create a Device for User:

```ruby
create_params = {}
create_params[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
create_params[:address] = '0x1Ea365269A3e6c8fa492eca9A531BFaC8bA1649E'
create_params[:api_signer_address] = '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
create_params[:device_uuid] = '593a967f-87bd-49a6-976c-52edf46c4df4'
create_params[:device_name] = 'Iphone S'
response = devices_service.create(create_params)
```

Get User Device Detail:

```ruby
get_params = {}
get_params[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
get_params[:device_address] = '0x1Ea365269A3e6c8fa492eca9A531BFaC8bA1649E'
response = devices_service.get(get_params)
```

Get User Devices List:

```ruby
get_params = {}
get_params[:user_id] = 'd194aa75-acd5-4f40-b3fb-e73a7cf7c0d9'
# get_params[:pagination_identifier] = "eyJsYXN0RXZhbHVhdGVkS2V5Ijp7InVpZCI6eyJTIjoiZDE5NGFhNzUtYWNkNS00ZjQwLWIzZmItZTczYTdjZjdjMGQ5In0sIndhIjp7IlMiOiIweDU4YjQxMDY0NzQ4OWI4ODYzNTliNThmZTIyMjYwZWIxOTYwN2IwZjYifX19"
# get_params[:addresses] = ["0x5906ae461eb6283cf15b0257d3206e74d83a6bd4","0xab248ef66ee49f80e75266595aa160c8c1abdd5a"]
# get_params[:limit] = 10
response = devices_service.get_list(get_params)
```



### Device Managers Module 


After a user is created and their device is registered via the API, 
their wallet can be activated. Activating a wallet involves the deployment of the following contracts:

* TokenHolder - each user in the economy is represented by a TokenHolder that holds the user's token balance.
* Device Manager (multi-signature) - this contract is configured to control the user's TokenHolder contract.
* DelayedRecoveryModule - this contract enables recovery in the event a key is lost.

In order to enable a user to access their tokens, i.e., interact 
with their TokenHolder contract, from multiple devices without 
having to share private keys across devices, a multi-signature 
contract is employed. We refer to this entity as the Device 
Manager in OST APIs.

To get information about a user’s Device Manager, use services provided in the Device Managers module.

```ruby
device_managers_service = ost_sdk.services.device_managers
```

Get Device Manager Detail:

```ruby
get_params = {}
get_params[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = device_managers_service.get(get_params)
```



### Sessions Module

In order to create a more seamless user experience, so that users don't have to 
sign a new transaction at every move in the application, we use session keys. 
These keys are authorized to sign transactions on the user's behalf 
for a predetermined amount of time and with a defined maximum spending 
limit per transaction.

These session keys are created in a user's wallet. A user’s TokenHolder 
contract can have multiple authorized session keys.

To get information about a user’s session keys, use services provided in the Sessions module.

```ruby
sessions_service = ost_sdk.services.sessions
```

Get User Session Detail:

```ruby
get_params = {}
get_params[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
get_params[:session_address] = '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
response = sessions_service.get(get_params)
```

Get User Sessions List:

```ruby
get_params = {}
get_params[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
# get_params[:pagination_identifier] = "eyJsYXN0RXZhbHVhdGVkS2V5Ijp7InVpZCI6eyJTIjoiZDE5NGFhNzUtYWNkNS00ZjQwLWIzZmItZTczYTdjZjdjMGQ5In0sIndhIjp7IlMiOiIweDU4YjQxMDY0NzQ4OWI4ODYzNTliNThmZTIyMjYwZWIxOTYwN2IwZjYifX19"
# get_params[:addresses] = ["0x5906ae461eb6283cf15b0257d3206e74d83a6bd4","0xab248ef66ee49f80e75266595aa160c8c1abdd5a"]
# get_params[:limit] = 10
response = sessions_service.get_list(get_params)
```


### Executing Transactions

For executing transactions, you need to understand the 4 modules described below.

#### Rules Module

When executing a token transfer, a user's TokenHolder contract 
interacts with a token rule contract. A token economy can have 
multiple token rule contracts. To enable a user to execute a 
token transfer, you need to start with fetching details of 
registered rule contracts and understanding their methods and the 
corresponding parameters passed in those methods.

To get information about deployed rule contracts, use services provided in the Rules module.


```ruby
rules_service = ost_sdk.services.rules
```

List Rules:

```ruby
get_params = {}
response = rules_service.get_list(get_params)
```

#### Price Points Module 

To know the OST price point in USD and when it was last updated, 
use services provided by the Price Points module.

```ruby
price_points_service = ost_sdk.services.price_points
```

Get Price Points Detail:

```ruby
get_params = {}
get_params[:chain_id] = 2000
response = price_points_service.get(get_params)
```

#### Transactions Module

After reviewing the rules information received using services in the Rules 
module, you will know what data is required to execute transfers 
with a token rule using the services provided in the Transaction module.

```ruby
transactions_service = ost_sdk.services.transactions
```

Execute Transaction DIRECT-TRANSFERS:

```ruby
execute_params = {}
execute_params[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
execute_params[:to] = '0x4e9314f004026F89Fc52790c3357b2D34FBA93b0'
raw_calldata = {}
raw_calldata[:method] = "directTransfers" # or "pay" 
raw_calldata[:parameters] = [["0x4e9314f004026F89Fc52790c3357b2D34FBA93b0", "0xe37906219ad67cc1301b970539c9860f9ce8d991"],['1','1']] 
execute_params[:raw_calldata] = raw_calldata.to_json

meta_property = {
      name: "transaction_name" , #like, download
      type: "user_to_user", # user_to_user, company_to_user, user_to_company
      details: "test"  # memo field to add additional info about the transaction
    }     

# execute_params[:meta_property] = meta_property
response = transactions_service.execute(execute_params)
```

Execute Transaction PAY:

```ruby
execute_params = {}
execute_params[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
execute_params[:to] = '0x4e9314f004026F89Fc52790c3357b2D34FBA93b0'
raw_calldata = {}
raw_calldata[:method] = "pay" 
raw_calldata[:parameters] = ["0xa9632350057c2226c5a10418b1c3bc9acdf7e2ee", ["0x4e9314f004026F89Fc52790c3357b2D34FBA93b0", "0xe37906219ad67cc1301b970539c9860f9ce8d991"],['1','1'], "USD", "23757000000000000"] 
execute_params[:raw_calldata] = raw_calldata.to_json

meta_property = {
      name: "transaction_name" ,
      type: "user_to_user",
      details: ""
    }

# execute_params[:meta_property] = meta_property
response = transactions_service.execute(execute_params)
```

Get Transaction Detail:

```ruby
get_params = {}
get_params[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
get_params[:transaction_id] = 't43g990c-32wa-ff3r-n553-9f1ew2t32rt1'
response = transactions_service.get(get_params)
```

Get User Transactions:

```ruby
get_params = {}
get_params[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'

meta_properties = [{
      name: "transaction_name" ,
      type: "user_to_user",
      details: "test"
    }]
# get_params[:statuses] = ["CREATED", "SUBMITTED", "SUCCESS", "FAILED"]
# get_params[:meta_properties] = meta_properties.to_json
# get_params[:limit] = 10
 
response = transactions_service.get_list(get_params)
```


#### Balances Module

Balance services offer the functionality to view a user’s balances.

```ruby
balances_service = ost_sdk.services.balance
```

Get token balance of an existing user:

```ruby
get_params = {}
get_params[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = balances_service.get(get_params)
```


### Recovery Owners Module 


A user’s Brand Tokens are held by a TokenHolder contract that is controlled ("owned") 
by a Device Manager; the device manager is controlled ("owned") by device keys created 
and held by the user in their wallets; and if any of those keys is lost, the Device 
Manager (which is a multi-signature contract) is programmed to allow replacement of a 
key by the recovery owner key for the user, via the DelayedRecoveryModule, which is deployed
at the time of the creation of the user's initial wallet.

To fetch the recovery owner address for a particular user, use services provided 
in the Users module. To fetch that recovery owner's information, then services 
provided in the Recovery Owners Module are used.

```ruby
recovery_owners_service = ost_sdk.services.recovery_owners
```

Get Recovery Owner Detail:

```ruby
get_params = {}
get_params[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
get_params[:recovery_owner_address] = '0x5F860598383868e8E8Ee0ffC5ADD92369Db37455'
response = recovery_owners_service.get(get_params)
```


### Tokens Module 

To get information about the Brand Token created on the OST Platform interface, use services provided 
by the Tokens module. You can use this service to obtain the chain ID of the auxiliary 
chain on which the token economy is running, in addition to other information.

```ruby
tokens_service = ost_sdk.services.tokens
```

Get Token Detail:

```ruby
get_params = {}
response = tokens_service.get(get_params)
```



### Chains Module

To get information about the auxiliary chain on which the token economy is running, use services 
provided by the Chains module.

```ruby
chains_service = ost_sdk.services.chains
```

Get Chain Detail:

```ruby
get_params = {}
get_params[:chain_id] = 2000
response = chains_service.get(get_params)
```

