module OSTSdk

  module Saas

    module V0

      class Manifest

        attr_reader :transaction_kind, :users

        # Initialize
        #
        # Arguments:
        #   api_base_url: (String)
        #   api_key: (String)
        #   api_secret: (String)
        #   api_spec: (Boolean)
        #
        def initialize(params)

          @transaction_kind = OSTSdk::Saas::V0::TransactionKind.new(params)
          @users = OSTSdk::Saas::V0::Users.new(params)

        end

      end

    end

  end

end
