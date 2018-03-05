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
        @url_prefix = '/transaction'
      end

      # Execute a transaction
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def execute(params)
        http_helper.send_post_request("#{@url_prefix}/execute", params)
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
