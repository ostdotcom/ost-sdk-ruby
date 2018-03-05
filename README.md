# Ost::Sdk::Ruby

## Installation

* Install OST Ruby SDK

  ```
  > gem install ost-sdk-ruby
  
  ```
* Obtain your <b>API Key</b> and <b>API Secret</b> from [https://kit.ost.com](https://kit.ost.com)

## Usage

##### Go to irb console and create an object of OST Ruby SDK, before accessing the Restful API endpoints:

  ```
  > irb
  
  require('ost-sdk-ruby')
  environment = 'sandbox'
  credentials = OSTSdk::Util::APICredentials.new('API KEY', 'API SECRET')
  ```

#### Transaction Kind Module 

##### Create an object to perform several transaction kind related actions

  ```
    ostTransactionKindObject = OSTSdk::Saas::TransactionKind.new(environment, credentials)
  ```

* Create new transaction kinds

  ```
    ostTransactionKindObject.create(name: 'Like', kind: 'user_to_user', currency_type: 'usd', currency_value: '1.25', commission_percent: '12')
  ```
  
  ```
    ostTransactionKindObject.create(name: 'Grant', kind: 'company_to_user', currency_type: 'bt', currency_value: '12', commission_percent: '0')
  ```
 
  ```
    ostTransactionKindObject.create(name: 'Buy', kind: 'user_to_company', currency_type: 'bt', currency_value: '100', commission_percent: '0')
  ```
  
* Get list of existing transaction kinds

  ```
    ostTransactionKindObject.list()
  ```
  
* Edit an existing transaction kind

  ```
    ostTransactionKindObject.edit(client_transaction_id: '12', name: 'New Transaction Kind')
  ```
  
#### User Module

##### Create user module object to perform user specific actions

  ```
    ostUserObject = OSTSdk::Saas::Users.new(environment, credentials)
  ```
 
* Create a new user

  ```
    ostUserObject.create(name: 'Alice')
  ```

* Get list of users   
 
  ``` 
    ostUserObject.list()
  ```
  
* Edit an existing user
 
  ```
    ostUserObject.edit(uuid: '1234-1928-1081dsds-djhksjd', name: 'Bob')
  ```
  
* Initiate Airdrop Tokens to a list of users

  ```
    ostUserObject.airdrop_tokens(amount: 100, list_type: 'all')
  ```
    
* As Airdrop tokens is a asynchronous task, you can check it's status as

  ```
    ostUserObject.get_airdrop_status(airdrop_uuid: '1234-1928-1081dsds-djhksjd')
  ```
  
* Get user ST Prime balance 

  ```
    ostUserObject.get_st_prime_balance(uuid: '1234-1928-1081dsds-djhksjd')
  ```

#### Transaction Module

##### Create an object of transactions module

  ```
    ostTransactionObject = OSTSdk::Saas::Transaction.new(environment, credentials)
  ```
  
* Transfer Branded Token by transaction kind

  ```
    ostTransactionObject.transfer_bt_by_transaction_kind(from_uuid: '1234-1928-1081dsds-djhksjd', to_uuid: '1234-1928-1081-1223232', transaction_kind: 'Purchase', token_symbol: 'ACME')
  ```

* Transfer Branded Token by value

  ```
    ostTransactionObject.transfer_bt_by_value(from_uuid: '1234-1928-1081dsds-djhksjd', to_uuid: '1234-1928-1081-1223232', amount: '1', token_symbol: 'ACME')
  ```
  
* Transfer ST Prime by value

  ```
    ostTransactionObject.transfer_st_prime_by_value(from_uuid: '1234-1928-1081dsds-djhksjd', to_uuid: '1234-1928-1081-1223232', amount: '1')
  ```

* Get transaction status
    
  ```
    ostTransactionObject.get_details(transaction_uuids: ['5f79063f-e22a-4d28-99d7-dd095f02c72e'])
  ```
