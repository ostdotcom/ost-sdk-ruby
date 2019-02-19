module OSTSdk

  module Saas

    class Manifest

      attr_reader :chains, :devices, :price_points, :sessions, :tokens, :users

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
        @chains = OSTSdk::Saas::Chains.new(params)
        @devices = OSTSdk::Saas::Devices.new(params)
        @price_points = OSTSdk::Saas::PricePoints.new(params)
        @sessions = OSTSdk::Saas::Sessions.new(params)
        @tokens = OSTSdk::Saas::Tokens.new(params)
        @users = OSTSdk::Saas::Users.new(params)
      end

    end

  end

end
