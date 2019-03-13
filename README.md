# Ost Ruby SDK
[![Build Status](https://travis-ci.org/ostdotcom/ost-sdk-ruby.svg?branch=master)](https://travis-ci.org/ostdotcom/ost-sdk-ruby)

The official [OST Ruby SDK](https://dev.ost.com/).

## Introduction

OST is a complete technology solution enabling mainstream businesses 
to easily launch blockchain-based economies at low risk and without 
requiring blockchain development.

At the core of OST is the concept of OST-powered Brand Tokens (BTs). 
BTs are white-label cryptocurrency tokens running on highly scalable 
Ethereum-based side blockchains, backed by staking OST Tokens into smart 
contracts on Ethereum mainnet. BTs can only be transferred to whitelisted 
user addresses within a business's community. This ensures that they stay 
within a specific BT community.

The OST technology stack is designed to give businesses everything they need 
to integrate, test, and deploy BTs.Within the OST suite of products developers 
can use OST KIT to create, test and launch Branded Tokens backed by OST. 

OST APIs and Server Side SDKs make it simple and easy for developers to 
integrate blockchain tokens into their apps.

## Advantages

Using the OST SDKs provides a number of advantages
* Simplicity: The SDKs reduce the complexity of integration by handling multiple authentication scenarios automatically. This means that the appropriate method call will be to minimize the end-user interactions.
* Performance: Caching, key management and nonce management ensure that end-users overall experience is improved.
* Security: Separating the Server Side API interactions from the client ensures that user's private keys are generated and stored securely on the user's device and not shared across the network.


## Requirements

Integrating OST SDK into your application can begin as soon as you create an account, with OST KIT. It is a three step process:
Sign-up on [https://kit.ost.com](https://kit.ost.com).
Create your branded token in OST KIT.
Obtain an API Key and API Secret from [https://kit.ost.com/mainnet/developer](https://kit.ost.com/mainnet/developer).


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


### Users Module 


Given that Brand Tokens are valuable to users, if their private keys are compromised it could 
result in the user being unable to access their tokens. To tackle this OST promotes a mobile-first 
approach and provides mobile(client) and server SDKs. 

* The server SDKs enable you to register users with KIT server.
* The client SDKs provides the additional support required for the ownership and management of Brand Tokens by end users so that they can 
   create keys and control their tokens. 

To register user with KIT you can use the services provided in user module. 

Initialize a Users object to perform user specific actions, like creating users:
``

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
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = users_service.get(getParams)
```

Get list of users:

```ruby
getParams = {}
# getParams[:ids] = ['91263ebd-6b2d-4001-b732-4024430ca758', '45673ebd-6b2d-4001-b732-4024430ca758']
# getParams[:limit] = 10
response = users_service.get_list(getParams)
```


### Devices Module 


Once a user is created via API, partner company should register user’s device with KIT.  
Post which they can activate user’s wallet on their device. Partner company can register multiple devices per user. 
 
Initialize a Device object to perform device specific actions, like registering devices:

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


After  user is created and their device is registered via API,  a wallet can be activated. 
Activating a wallet involves the deployment of :
* TokenHolder contract - each user in the economy is be represented by this smart contract on blockchain.  It holde the user's balances,
* Device Manager (Multisig contract) - This contract is configured to control the user's TokenHolder contract, and 
* DelayedRecoveryModule contract - that supports recovery via a 6 digit PIN.
 
In order to enable user to access their tokens i.e their TokenHolder contract from multiple devices without having to share private keys across devices we came up with a multi-signature contract. 
We refer to this entity as device manager in OST APIs.  
To get information about user’s device manager use services provided in device manager module. 

```ruby
device_managers_service = ost_sdk.services.device_managers
```

Get device manager details of an existing user:

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = device_managers_service.get(getParams)
```



### Session Module

In order to create a seamless user experience so that users don't have to sign a new transaction at every move in the application we came up with the concept of sessionKeys. 
These keys are used to sign messages on user's behalf for a predetermined amount of time and with a defined maximum spending limit per-transaction. 
These keys are created on the mobile device from where the end user participates in the economy. Each key has a corresponding public key, which in-turn has a corresponding public address. 
User’s TokenHolder contract can have multiple sessionKeys for signing messages on user’s behalf. 

To get information about user’s session keys use services provided in session module. 

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
# getParams[:pagination_identifier] = "eyJsYXN0RXZhbHVhdGVkS2V5Ijp7InVpZCI6eyJTIjoiZDE5NGFhNzUtYWNkNS00ZjQwLWIzZmItZTczYTdjZjdjMGQ5In0sIndhIjp7IlMiOiIweDU4YjQxMDY0NzQ4OWI4ODYzNTliNThmZTIyMjYwZWIxOTYwN2IwZjYifX19"
# getParams[:addresses] = ["0x5906ae461eb6283cf15b0257d3206e74d83a6bd4","0xab248ef66ee49f80e75266595aa160c8c1abdd5a"]
# getParams[:limit] = 10
response = sessions_service.get_list(getParams)
```


## For executing transactions we need to understand 3 modules listed below: 

To enable partner companies to design Rules that align with their economy goals and define the behavior of the token transfer, 
they have the flexibility to write their custom rules contract. 
OST has written one rule contract the [PricerRule Contract](https://github.com/OpenSTFoundation/openst-contracts/blob/develop/contracts/rules/PricerRule.sol)  for partner companies to use. 
For executing a token transfer, end-user's TokenHolder contract interacts with Rules Contract.



### Rules Module 

So for executing a token transfer, partner company need to start with fetching details of deployed rules contract and understand 
the methods written within them and the corresponding parameters passed in those methods.
To get information about rules contracts deployed use services provided in rule module.  


```ruby
rules_service = ost_sdk.services.rules
```

List all rules:

```ruby
getParams = {}
response = rules_service.get_list(getParams)
```

### Transactions Module 

Once you’ve fetched the rule method and rule parameters to be passed using services in rule module you can start with executing 
the transfer using the services provided in transaction module.

```ruby
transactions_service = ost_sdk.services.transactions
```

Execute company to user transaction [directTransfers method]:

```ruby
executeParams = {}
executeParams[:user_id] = 'e50e252c-318f-44a5-b586-9a9ea1c41c15'
executeParams[:to] = '0x4e9314f004026F89Fc52790c3357b2D34FBA93b0'
raw_calldata = {}
raw_calldata[:method] = "directTransfers" # or "pay" 
raw_calldata[:parameters] = [["0x4e9314f004026F89Fc52790c3357b2D34FBA93b0", "0xe37906219ad67cc1301b970539c9860f9ce8d991"],['1','1']] 
executeParams[:raw_calldata] = raw_calldata.to_json

meta_property = {
      name: "transaction_name" , #like, download
      type: "user_to_user", # user_to_user, company_to_user, user_to_company
      details: "test"  # memo field to add additional info about the transaction
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

meta_property = [{
      name: "transaction_name" ,
      type: "user_to_user",
      details: "test"
    }]
# getParams[:status] = ["CREATED", "SUBMITTED", "SUCCESS", "FAILED"]
# getParams[:meta_property] = meta_property.to_json
# getParams[:limit] = 10
 
response = transactions_service.get_list(getParams)
```


### Balance Module 

Balance services offer the functionality to view user’s balances. 

```ruby
balance_service = ost_sdk.services.balance
```

Get token balance of an existing user:

```ruby
getParams = {}
getParams[:user_id] = '91263ebd-6b2d-4001-b732-4024430ca758'
response = balance_service.get(getParams)
```


### Recovery Owners Module 


End user’s brand tokens are held by a token holder contract that is controlled ("owned") by device manager; 
the device manager is controlled ("owned") by device keys created and held by the user in their wallets; and if those keys are compromised, 
the device manager (which is a multi-signature contract) is programmed to allow replacement of a key by a recovery key.

The DelayedRecoveryModule is deployed at the time of the creation of the wallet. The recoveryOwner public-private key pair 
is created using inputs from the Partner, OST and the user. The public addresse of the recoveryOwner is stored 
on this DelayedRecoveryModule contract.

Recovering access to tokens after the owner key becomes compromised

User requests recovery from partner company application by entering their 6-digit recovery PIN. Once the request has 
been raised user waits for defined delay which is 12 hours currently.

OST wallet SDK Create the recoveryOwner private key using the inputs from the Partner, OST and the user.  This should exactly match the recoveryOwner that was made when the wallet was initially created. 

To fetch the recoveryOwner address for a particular user services provided in Recovery Owner Module are used.

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


### Tokens Module 

To get information about the token created on the OST KIT interface use services provided by token module. 
Partner company can use this service to know the chain id , the auxiliary chain on which their economy is running apart from other information.

```ruby
tokens_service = ost_sdk.services.tokens
```

Get Token Details:

```ruby
getParams = {}
response = tokens_service.get(getParams)
```



### Chains Module

To get information about the auxiliary chain on which the token economy is running use services provided by chain module. 

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

To know the OST price point in USD and the last timestamp when it was updateds use  services provided by Price Point module.

```ruby
price_points_service = ost_sdk.services.price_points
```

Get price points of an auxiliary chain:

```ruby
getParams = {}
getParams[:chain_id] = 2000
response = price_points_service.get(getParams)
```

