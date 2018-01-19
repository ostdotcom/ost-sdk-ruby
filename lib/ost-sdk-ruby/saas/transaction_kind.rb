module OSTSdk

  module Saas

    class TransactionKind < OSTSdk::Saas::Base

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #
      def initialize(environment, credentials)
        super
        @url_prefix = '/transaction/kind'
      end

      # Fetches the list of all transaction types
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def list(params = {})
        http_helper.send_get_request("#{@url_prefix}/get-all", params)
      end

      # Creates a new transaction type
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def create(params)
        http_helper.send_post_request("#{@url_prefix}/new", params)
      end

    end

  end

end
