module OSTSdk

  module Saas

    class TransactionKind < OSTSdk::Saas::Base

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #   api_spec: (Boolean)
      #
      def initialize(environment, credentials, api_spec = false)
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

      # Updates an existing transaction type
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def edit(params)
        http_helper.send_post_request("#{@url_prefix}/edit", params)
      end

    end

  end

end
