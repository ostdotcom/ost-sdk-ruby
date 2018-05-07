module OSTSdk

  module Saas

    module V1

      class Manifest

        attr_reader :users, :token

        # Initialize
        #
        # Arguments:
        #   api_base_url: (String)
        #   api_key: (String)
        #   api_secret: (String)
        #   api_spec: (Boolean)
        #
        def initialize(params)

          @users = OSTSdk::Saas::V1::Users.new(params)
          @token = OSTSdk::Saas::V1::Token.new(params)

        end

      end

    end

  end

end
