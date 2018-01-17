module OSTSdk

  module Util

    class APICredentials

      # Initialize
      #
      # Arguments:
      #   api_key: (String)
      #   api_secret: (String)
      #
      def initialize(api_key, api_secret)
        @api_key = api_key
        @api_secret = api_secret
      end

      # Returns:
      #   api_key: (String)
      #
      attr_reader :api_key

      # Returns:
      #   api_secret: (String)
      #
      attr_reader :api_secret

    end

  end

end
