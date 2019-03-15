module OSTSdk

  module Saas

      class Chains < OSTSdk::Saas::Base

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
          @url_prefix = '/chains'
        end

        # Get chain details
        #
        # Returns:
        #   response: (Hash)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{get_chain_id!(params)}", params)
        end

      end

    end

end
