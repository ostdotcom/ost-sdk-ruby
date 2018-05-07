module OSTSdk

  module Saas

    module V1

      class Token < OSTSdk::Saas::Base

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
          @url_prefix = '/token'
        end

        # fetch details of a token
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/", params)
        end

      end

    end

  end

end
