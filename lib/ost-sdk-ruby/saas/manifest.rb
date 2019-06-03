module OSTSdk

  module Saas

    class Manifest

      attr_reader :balance, :chains, :device_managers, :devices, :price_points, :recovery_owners, :rules,
                  :sessions, :tokens, :transactions, :users, :base_tokens

      # Initialize
      #
      # Arguments:
      #   api_base_url: (String)
      #   api_key: (String)
      #   api_secret: (String)
      #   api_spec: (Boolean)
      #   config: (Hash)
      #
      def initialize(params)

        @balance = OSTSdk::Saas::Balance.new(params)
        @chains = OSTSdk::Saas::Chains.new(params)
        @device_managers = OSTSdk::Saas::DeviceManagers.new(params)
        @devices = OSTSdk::Saas::Devices.new(params)
        @price_points = OSTSdk::Saas::PricePoints.new(params)
        @recovery_owners = OSTSdk::Saas::RecoveryOwners.new(params)

        @rules = OSTSdk::Saas::Rules.new(params)
        @sessions = OSTSdk::Saas::Sessions.new(params)
        @tokens = OSTSdk::Saas::Tokens.new(params)
        @transactions = OSTSdk::Saas::Transactions.new(params)
        @users = OSTSdk::Saas::Users.new(params)
        @base_tokens = OSTSdk::Saas::BaseTokens.new(params)

      end

    end

  end

end
