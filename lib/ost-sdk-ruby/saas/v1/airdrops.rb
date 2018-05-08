module OSTSdk

  module Saas

    module V1

      class Airdrops < OSTSdk::Saas::Base

        # Initialize
        #
        # Arguments:
        #   api_base_url: (String)
        #   api_key: (String)
        #   api_secret: (String)
        #   api_spec: (Boolean)
        #
        def initialize(params)
          super
          @url_prefix = '/airdrops'
        end

        # Execute an airdrop
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def execute(params = {})
          http_helper.send_post_request("#{@url_prefix}/", params)
        end

        # Get details about a airdrop
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{params.delete(:id)}", params)
        end

        # Fetches the list of airdrop (with or without filters)
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def list(params = {})
          http_helper.send_get_request("#{@url_prefix}/", params)
        end

      end

    end

  end

end
