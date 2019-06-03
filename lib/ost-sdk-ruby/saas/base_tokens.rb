module OSTSdk

  module Saas


    class BaseTokens < OSTSdk::Saas::Base

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
        super
        @url_prefix = '/base-tokens'
      end

      # Get token details
      #
      # Returns:
      #   response: (Hash)
      #
      def get(params = {})
        http_helper.send_get_request("#{@url_prefix}", params)
      end

    end

  end

end
