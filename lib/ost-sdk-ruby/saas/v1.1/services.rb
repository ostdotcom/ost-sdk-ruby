module OSTSdk

  module Saas

    module V1Dot1

      class Services

        attr_reader :users, :token, :actions, :airdrops, :transactions, :transfers, :balances, :ledger

        # Initialize
        #
        # Arguments:
        #   api_base_url: (String)
        #   api_key: (String)
        #   api_secret: (String)
        #   api_spec: (Boolean)
        #
        def initialize(params)

          # Modules which were implemented with V1.0
          @users = OSTSdk::Saas::V1::Users.new(params)
          @token = OSTSdk::Saas::V1::Token.new(params)
          @actions = OSTSdk::Saas::V1::Actions.new(params)
          @airdrops = OSTSdk::Saas::V1::Airdrops.new(params)
          @transactions = OSTSdk::Saas::V1::Transactions.new(params)
          @transfers = OSTSdk::Saas::V1::Transfers.new(params)

          # Modules which were implemented with V1.1
          @balances = OSTSdk::Saas::V1Dot1::Balances.new(params)
          @ledger = OSTSdk::Saas::V1Dot1::Ledger.new(params)

        end

      end

    end

  end

end
