module OSTSdk

  module Saas

    class Addresses < OSTSdk::Saas::Base

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #   api_spec: (Boolean)
      #
      def initialize(environment, credentials, api_spec = false)
        super
        @url_prefix = '/addresses'
      end

      # Fetches balances transaction types
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def fetch_balances(params)
        http_helper.send_get_request("#{@url_prefix}/fetch-utility-chain-balances", params)
      end

    end

  end

end
