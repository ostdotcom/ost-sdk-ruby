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

      # Fetches the list of all transaction types
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def create(params = {})
        http_helper.send_post_request("#{@url_prefix}/create", params)
      end

    end

  end

end
