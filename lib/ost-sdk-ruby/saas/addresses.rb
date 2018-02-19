module OSTSdk

  module Saas

    class Addresses < OSTSdk::Saas::Base

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #
      def initialize(environment, credentials)
        super
        @url_prefix = '/addresses'
      end

      # Fetches balances transaction types
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def fetch_balances(params)
        http_helper.send_get_request("#{@url_prefix}/fetch-balances", params)
      end

    end

  end

end
