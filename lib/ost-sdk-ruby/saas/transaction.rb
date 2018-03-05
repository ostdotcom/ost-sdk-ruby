module OSTSdk

  module Saas

    class Transaction < OSTSdk::Saas::Base

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #   api_spec: (Boolean)
      #
      def initialize(environment, credentials, api_spec = false)
        super
        @url_prefix = '/transfer'
      end

      # Execute transfer BT by tx kind
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def transfer_bt_by_transaction_kind(params)
        http_helper.send_post_request("#{@url_prefix}/bt-by-tx-kind", params)
      end

      # Execute transfer BT by tx kind
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def transfer_bt_by_value(params)
        http_helper.send_post_request("#{@url_prefix}/bt-by-value", params)
      end

      # Execute transfer ST Prime by value
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def transfer_st_prime_by_value(params)
        http_helper.send_post_request("#{@url_prefix}/st-prime-by-value", params)
      end

      # Get details of a transaction(s)
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def get_details(params)
        http_helper.send_post_request("#{@url_prefix}/fetch_details", params)
      end

    end

  end

end
