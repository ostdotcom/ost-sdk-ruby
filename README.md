# OST Server-Side Ruby SDK
[![Build Status](https://travis-ci.org/ostdotcom/ost-sdk-ruby.svg?branch=develop)](https://travis-ci.org/ostdotcom/ost-sdk-ruby)

[OST](https://dev.ost.com/) Platform SDK for Ruby.

## Introduction

OST is a complete technology solution enabling mainstream businesses 
to easily launch blockchain based economies without requiring blockchain development.

Brand Tokens (BTs) are white-label cryptocurrency tokens with utility representations 
running on highly-scalable Ethereum-based utility blockchains, 
backed by value token (such as OST, USDC) staked on Ethereum mainnet. Within a business`s 
token economy, BTs can only be transferred to whitelisted user addresses. 
This ensures that they stay within the token economy.

The OST technology stack is designed to give businesses everything they need 
to integrate, test, and deploy BTs. Within the OST suite of products, developers 
can use OST Platform to create, test, and launch Brand Tokens.

OST APIs and server-side SDKs make it simple and easy for developers to 
integrate blockchain tokens into their apps.

For documentation, visit [https://dev.ost.com/](https://dev.ost.com/)

## Getting Started

### Setup Brand Token
1. Sign-up on [OST Platform](https://platform.ost.com) and setup your Brand Token.
2. Obtain your API Key and API Secret from [developers page](https://platform.ost.com/mainnet/developer).


### Installation

The preferred way to install the OST Ruby SDK is to use the RubyGems package manager for Ruby. Simply type the following into a terminal window:

```bash
 gem install ost-sdk-ruby
```

## Usage
* Require the OST Ruby SDK:

    ```ruby
    require('ost-sdk-ruby')
    ```

* Initialize the SDK object.

    ```ruby
    # Declare connection parameters.
     
    # Mandatory API parameters.
     
    api_key = '__abc'; # OBTAINED FROM DEVELOPER PAGE
    api_secret = '_xyz';  # OBTAINED FROM DEVELOPER PAGE
    
    # The valid API endpoints are: 
    # 1. Mainnet: "https://api.ost.com/mainnet/v2/"
    # 2. Testnet: "https://api.ost.com/testnet/v2/"
    api_base_url = 'https://api.ost.com/testnet/v2/'
    
    # Optional API parameters.
    
    # This is the timeout in seconds for which the socket connection will remain open.
    timeout_in_seconds = ''
    options = {timeout: timeout_in_seconds}
    
    # OST server side sdk object.
    ost_sdk = OSTSdk::Saas::Services.new({api_key: api_key, api_secret: api_secret, api_base_url: api_base_url, config: options})
    ```

### Users Module 

* Initialize Users service object to perform user specific actions.

    ```ruby
    users_service = ost_sdk.services.users
    ```

* Create User. This creates a unique identifier for each user.

    ```ruby
    create_params = {}
    response = users_service.create(create_params)
    ```

* Get User Detail using the userId obtained in user create.

    ```ruby
    # Mandatory API parameters
   
    # UserId of user for whom user details needs to be fetched.
    user_id = '912___'
  
    get_params = {}
    get_params[:user_id] = user_id
    response = users_service.get(get_params)
    ```

* Get Users List. Pagination is supported by this API.

    ```ruby
    # Mandatory API parameters 
    # No mandatory parameters.
   
    # Optional API parameters
  
    # Array of userIds for which data needs to be fetched.
    ids_array = ['c2c___', 'd2c6___']
  
    # Pagination identifier from the previous API call response. Not needed for page one.
    pagination_identifier = 'e77y___'
 
    # Limit.
    limit = 10
  
    get_params = {}
    get_params[:ids] = ids_array
    get_params[:limit] = limit
    get_params[:pagination_identifier] = pagination_identifier
    response = users_service.get_list(get_params)
    ```


### Devices Module 
 
* Initialize Devices service object to perform device specific actions.

    ```ruby
    devices_service = ost_sdk.services.devices
    ```

* Create a Device for User.

    ```ruby
    # Mandatory API parameters
     
    # UserId of user for whom device needs to be created.
    user_id = 'c2c6___'
         
    # Device address of user's device.
    device_address = '0x1Ea___'
         
    # Device API signer address. 
    api_signer_address = '0x5F8___'
     
    create_params = {}
    create_params[:user_id] = user_id
    create_params[:address] = device_address
    create_params[:api_signer_address] = api_signer_address
    response = devices_service.create(create_params)
    ```

* Get User Device Detail using userId and deviceAddress.

    ```ruby
    # Mandatory API parameters
  
    # UserId of user for whom device details needs to be fetched.
    user_id = 'c2c6f___'
         
    # Device address of user's device.
    device_address = '0x1Ea___'
     
    get_params = {}
    get_params[:user_id] = user_id
    get_params[:device_address] = device_address
    response = devices_service.get(get_params)
    ```

* Get User Devices List. Pagination is supported by this API.

    ```ruby
    # Mandatory API parameters
     
    # UserId of user for whom device details needs to be fetched.
    user_id = 'c2c6___'
     
    # Optional API parameters
    
    # Pagination identifier from the previous API call response. Not needed for page one.
    pagination_identifier = 'eyJs___'
    
    # Array of device addresses of end user.
    device_addresses_array = ['0x590___','0xab___']
    
    # Limit.
    limit = 10
     
    get_params = {}
    get_params[:user_id] = user_id
    get_params[:pagination_identifier] = pagination_identifier
    get_params[:addresses] = device_addresses_array
    get_params[:limit] = limit
    response = devices_service.get_list(get_params)
    ```

### Device Managers Module 

* Initialize Device Manager service object to perform device manager specific actions.

    ```ruby
    device_managers_service = ost_sdk.services.device_managers
    ```

* Get Device Manager Detail using userId.

    ```ruby
    # Mandatory API parameters
     
    # UserId of user for whom device manager details needs to be fetched.
    user_id = 'c2c___'
     
    get_params = {}
    get_params[:user_id] = user_id
    response = device_managers_service.get(get_params)
    ```

### Sessions Module

* Initialize Sessions service object to perform session specific actions.

    ```ruby
    sessions_service = ost_sdk.services.sessions
    ```

* Get User Session Detail using userId and session address.

    ```ruby
    # Mandatory API parameters
    
    # UserId of user for whom device manager details needs to be fetched.
    user_id = 'c2c___'
  
    # Session address of user for which details needs to be fetched.
    session_address = '0x5F8___'
  
    get_params = {}
    get_params[:user_id] = user_id
    get_params[:session_address] = session_address
    response = sessions_service.get(get_params)
    ```

* Get User Sessions List using userId. Pagination is supported by this API.

    ```ruby
    # Mandatory API parameters
    
    # UserId of user for whom session details needs to be fetched.
    user_id = 'c2c6___'
    
    # Optional API parameters
        
    # Pagination identifier from the previous API call response.  Not needed for page one.
    pagination_identifier = 'eyJsY___'
     
    # Array of session addresses of end user.
    session_addresses_array = ['0x59___','0xab___']
    
    # Limit.
    limit = 10
    
    get_params = {}
    get_params[:user_id] = user_id
    get_params[:pagination_identifier] = pagination_identifier
    get_params[:addresses] = session_addresses_array
    get_params[:limit] = limit
    response = sessions_service.get_list(get_params)
    ```

### Executing Transactions

For executing transactions, you need to understand the 4 modules described below.

#### Rules Module

* Initialize Rules service object to perform rules specific actions.

    ```ruby
    rules_service = ost_sdk.services.rules
    ```

* List Rules.
    
    ```ruby
    get_params = {}
    response = rules_service.get_list(get_params)
    ```

#### Price Points Module 

* Initialize Price Points service object to perform price points specific actions.

    ```ruby
    price_points_service = ost_sdk.services.price_points
    ```

* Get Price Points Detail.

    ```ruby
    # Mandatory API parameters
    
    chain_id = 2000
     
    get_params = {}
    get_params[:chain_id] = chain_id
    response = price_points_service.get(get_params)
    ```


#### Transactions Module

* Initialize Transactions service object to perform transaction specific actions.

    ```ruby
    transactions_service = ost_sdk.services.transactions
    ```

* DIRECT-TRANSFERS execute transaction should be used to transfer BTs to your end-users.

    ```ruby
    # Mandatory API parameters
    
    # Token holder address of receiver.
    transfer_to_address = '0x4e___'
    
    # Amount of tokens to be transferred. 
    transfer_amount = '1'
     
    # Parameters required for rule execution.
    raw_calldata = {}
    raw_calldata[:method] = 'directTransfers' # Rule name which needs to be passed as-is.
    raw_calldata[:parameters] = [[transfer_to_address],[transfer_amount]] 
     
    # Company userId.
    company_user_id = 'ee8___'
     
    # Address of DirectTransfer rule. Use list rules API of Rules module to get the address of rules.
    # In the rules array which you will get in response, use the address having name "Direct Transfer". 
    direct_transfer_rule_address = '0xe37___'
    
    # Optional API parameters
    
    # Name of the transaction. Eg. 'like', 'download', etc.
    # NOTE: Max length 25 characters (Allowed characters: [A-Za-z0-9_/s])
    transaction_name = 'like'
    
    # Transaction type. Possible values: 'company_to_user', 'user_to_user', 'user_to_company'.
    transaction_type = 'company_to_user'
     
    # Some extra information about transaction.
    # NOTE: Max length 125 characters (Allowed characters: [A-Za-z0-9_/s])
    details = 'lorem_ipsum'
    
    # Additional transaction information. There is no dependency between any of the metaProperty keys.
    # However, if a key is present, its value cannot be null or undefined.
    meta_property = {
          name: transaction_name,
          type: transaction_type,
          details: details
        }  
    
    execute_params = {}
    execute_params[:user_id] = company_user_id
    execute_params[:to] = direct_transfer_rule_address
    execute_params[:raw_calldata] = raw_calldata.to_json
    execute_params[:meta_property] = meta_property
    response = transactions_service.execute(execute_params)
    ```

* PAY Execute Transaction should be used when transactions of BTs equivalent to some fiat amount need to be executed.

    ```ruby
    # Mandatory API parameters
    
    # Token holder address of receiver.
    transfer_to_address = '0x4e___'
    
    # Company holder address of sender.
    company_token_holder_address= '0x34r___'
     
    # Pay currency code. Supported currency codes are 'USD', 'EUR' and 'GBP'.
    pay_currency_code = 'USD'
    
    # In pay transaction, the transfer amounts are in pay currency (fiat currency like USD) which then are converted
    # into tokens. Use get price point detail API of Price Points module to get this value.
    price_point = 0.020606673
    
    # Price point needs to be passed in atto. Multiply the price point with 10^18. Also, this value should be a string.
    # You might need to use bignumber depending on your use case. 
    intended_price_point_in_atto = "%.f" % ((price_point * 10**18)
  
    # Amount of Fiat to be transferred.
    transfer_amount_in_fiat = 0.1
      
    # Transfer amount in wei needs to be passed in atto. Multiply the fiat transfer amount with 10^18. Also, this value should be a string.
    # You might need to use bignumber depending on your use case. 
    fiat_transfer_amount_in_atto = "%.f" % (transfer_amount_in_fiat * 10**18)
    
    # Parameters required for rule execution.
    raw_calldata = {}
    raw_calldata[:method] = 'pay' # Rule name which needs to be passed as-is.
    raw_calldata[:parameters] = [company_token_holder_address, [transfer_to_address],[fiat_transfer_amount_in_atto], pay_currency_code, intended_price_point_in_atto] 
     
    # Company userId.
    company_user_id = 'ee8___'
     
    # Address of Pay rule. Use list rules API of Rules module to get the address of rules.
    # In the rules array which you will get in response, use the address having name "Pricer". 
    pay_rule_address = '0xe37___'
    
    # Optional API parameters
    
    # Name of the transaction. Eg. 'like', 'download', etc.
    # NOTE: Max length 25 characters (Allowed characters: [A-Za-z0-9_/s])
    transaction_name = 'like'
    
    # Transaction type. Possible values: 'company_to_user', 'user_to_user', 'user_to_company'.
    transaction_type = 'company_to_user'
     
    # Additional transaction information. There is no dependency between any of the metaProperty keys.
    # However, if a key is present, its value cannot be null or undefined.
    details = 'lorem_ipsum'
    
    # Additional transaction information. There is no dependency between any of the metaProperty keys.
    # However, if a key is present, its value cannot be null or undefined.
    meta_property = {
          name: transaction_name,
          type: transaction_type,
          details: details
        }
    
    execute_params = {}
    execute_params[:user_id] = company_user_id
    execute_params[:to] = pay_rule_address
    execute_params[:raw_calldata] = raw_calldata.to_json
    execute_params[:meta_property] = meta_property
    response = transactions_service.execute(execute_params)
    ```

* Get Transaction Detail using userId and transactionId.

    ```ruby
    # Mandatory parameters
     
    # UserId of end-user.
    user_id = 'e50___'
    
    # Unique identifier of the transaction to be retrieved.
    transaction_id = 't43___'
    
    get_params = {}
    get_params[:user_id] = user_id
    get_params[:transaction_id] = transaction_id
    response = transactions_service.get(get_params)
    ```

* Get User Transactions using userId. Pagination is supported by this API.

    ```ruby
    # Mandatory parameters
     
    # UserId of end-user.
    user_id = 'e502___'
    
    # Optional API parameters
      
    # Array of status values.
    statuses_array = ['CREATED', 'SUBMITTED', 'SUCCESS', 'FAILED']
    
    # Name of the transaction. Eg. 'like', 'download', etc.
    # NOTE: Max length 25 characters (Allowed characters: [A-Za-z0-9_/s])
    transaction_name = 'like'
    
    # Transaction type. Possible values: 'company_to_user', 'user_to_user', 'user_to_company'.
    transaction_type = 'company_to_user'
    
    # NOTE: Max length 125 characters (Allowed characters: [A-Za-z0-9_/s])
    details = 'lorem_ipsum'
    
    # Additional transaction information. There is no dependency between any of the metaProperty keys.
    # However, if a key is present, its value cannot be null or undefined. 
    meta_properties = [{
          name: transaction_name,
          type: transaction_type,
          details: details
        }]
    
    # Limit.
    limit = 10 
    
    # Pagination identifier from the previous API call response.  Not needed for page one.
    pagination_identifier = 'eyJsY___'
    
    get_params = {}
    get_params[:user_id] = user_id
    get_params[:statuses] = statuses_array
    get_params[:meta_properties] = meta_properties.to_json
    get_params[:limit] = limit
    get_params[:pagination_identifier] = pagination_identifier
    response = transactions_service.get_list(get_params)
    ```


#### Balances Module

* Initialize Balances service object to perform balances specific actions.

    ```ruby
    balances_service = ost_sdk.services.balance
    ```

* Get User Balance using userId.

    ```ruby
    # Mandatory API parameters
    
    # UserId for whom balance needs to be fetched.
    user_id = '987w___'
    
    get_params = {}
    get_params[:user_id] = user_id
    response = balances_service.get(get_params)
    ```


### Recovery Owners Module

* Initialize Recovery Owners service object to perform recovery owners specific actions.

    ```ruby
    recovery_owners_service = ost_sdk.services.recovery_owners
    ```

* Get Recovery Owner Detail using userId and recovery owner address.

    ```ruby
    # Mandatory API parameters
    
    # UserId for whom recovery details needs to be fetched.
    user_id = '987w___'
    
    # Recovery address of user.
    recovery_owner_address = '0x54e___'
    
    get_params = {}
    get_params[:user_id] = user_id
    get_params[:recovery_owner_address] = recovery_owner_address
    response = recovery_owners_service.get(get_params)
    ```


### Tokens Module 

* Initialize Tokens service object to perform tokens specific actions.

    ```ruby
    tokens_service = ost_sdk.services.tokens
    ```

* Get Token Detail.

    ```ruby
    get_params = {}
    response = tokens_service.get(get_params)
    ```


### Chains Module

* Initialize Chains service object to perform chains specific actions.

    ```ruby
    chains_service = ost_sdk.services.chains
    ```

* Get Chain Detail using chainId.

    ```ruby
    # Mandatory API parameters
    
    # ChainId for which details needs to be fetched. Only origin chainId and OST-specific auxiliary chainIds are allowed.
    chain_id = 2000
    
    get_params = {}
    get_params[:chain_id] = chain_id
    response = chains_service.get(get_params)
    ```


### Base Tokens Module 

* Initialize Base Tokens service object to perform base tokens specific actions.

    ```ruby
    base_tokens_service = ost_sdk.services.base_tokens
    ```

* Get Base Tokens Detail.

    ```ruby
    get_params = {}
    response = base_tokens_service.get(get_params)
    ```


### Webhooks Module

* Initialize Webhooks service object to perform webhooks specific actions.

    ```ruby
    webhooks_service = ost_sdk.services.webhooks
    ```

* Create Webhook using the topics and the subscription url.

    ```ruby
    # Mandatory API parameters
    
    # Array of topics.
    topic_params = ['transactions/initiate', 'transactions/success']
    
    # URL where you want to receive the event notifications.
    url = 'https://www.testingWebhooks.com'
    
    # Optional API parameters
    
    # Status of a webhook. Possible values are 'active' and 'inactive'.
    status = 'active' 
    
    create_params = {}
    create_params[:topics] = topic_params
    create_params[:url] = url
    create_params[:status] = status
    response = webhooks_service.create(create_params)
    ```

* Update existing Webhook using a webhookId and an array of topics.

    ```ruby
    # Mandatory API parameters
    
    # Array of topics.
    topic_params = ['transactions/initiate', 'transactions/success']
    
    # Unique identifier for a webhook.
    webhook_id = 'a743___'
    
    # Optional API parameters
    
    # Status of a webhook. Possible values are 'active' and 'inactive'.
    status = 'active' 
    
    update_params = {}
    update_params[:webhook_id] = webhook_id
    update_params[:topics] = topic_params
    update_params[:status] = status
    response = webhooks_service.update(update_params)
    ```

* Get Webhook using webhookId.

    ```ruby
    # Mandatory API parameters
     
    # Unique identifier for a webhook.
    webhook_id = 'a743___'
    
    get_params = {}
    get_params[:webhook_id] = webhook_id
    response = webhooks_service.get(get_params)
    ```

* Get Webhook List. Pagination is supported by this API.

    ```ruby
    # Mandatory API parameters
    # No mandatory parameters.
    
    # Optional API parameters
    
    # Limit.
    limit = 10
    
    # Pagination identifier from the previous API call response.  Not needed for page one.
    pagination_identifier = 'eyJwY___'
    
    get_params = {}
    get_params[:limit] = limit
    get_params[:pagination_identifier] = pagination_identifier
    response = webhooks_service.get_list(get_params)
    ```

* Delete Webhook using webhookId.

    ```ruby
    # Mandatory API parameters
     
    # Unique identifier for a webhook.
    webhook_id = 'a743___'
    
    delete_params = {}
    delete_params[:webhook_id] = webhook_id
    response = webhooks_service.delete(delete_params)
    ```

* Verify webhook request signature. This can be used to validate if the webhook received at your end from OST platform is correctly signed.

    ```ruby
    signature_params = {}
    
    # Webhook data obtained.
    webhook_event_data = {"id":"54e3cd1c-afd7-4dcf-9c78-137c56a53582","topic":"transactions/success","created_at":1560838772,"webhook_id":"0823a4ea-5d87-44cf-8ca8-1e5a31bf8e46","version":"v2","data":{"result_type":"transaction","transaction":{"id":"ddebe817-b94f-4b51-9227-f543fae4715a","transaction_hash":"0x7ee737db22b58dc4da3f4ea4830ca709b388d84f31e77106cb79ee09fc6448f9","from":"0x69a581096dbddf6d1e0fff7ebc1254bb7a2647c6","to":"0xc2f0dde92f6f3a3cb13bfff43e2bd136f7dcfe47","nonce":3,"value":"0","gas_price":"1000000000","gas_used":120558,"transaction_fee":"120558000000000","block_confirmation":24,"status":"SUCCESS","updated_timestamp":1560838699,"block_timestamp":1560838698,"block_number":1554246,"rule_name":"Pricer","meta_property":{},"transfers":[{"from":"0xc2f0dde92f6f3a3cb13bfff43e2bd136f7dcfe47","from_user_id":"acfdea7d-278e-4ffc-aacb-4a21398a280c","to":"0x0a754aaab96d634337aac6556312de396a0ca46a","to_user_id":"7bc8e0bd-6761-4604-8f8e-e33f86f81309","amount":"112325386","kind":"transfer"}]}}}
    signature_params[:stringified_data] = webhook_event_data.to_json
    
    # Get webhoook version from webhook events data.
    signature_params[:version] = "v2"
    
    # Get ost-timestamp from the response received in event.
    signature_params[:request_timestamp] = '1559902637'
    
    # Get signature from the response received in event.
    signature_params[:signature] = '2c56c143550c603a6ff47054803f03ee4755c9c707986ae27f7ca1dd1c92a824'
    
    signature_params[:webhook_secret] = 'mySecret'
    response = webhooks_service.verify_signature(signature_params)
    ```
