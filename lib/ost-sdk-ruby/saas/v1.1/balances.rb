module OSTSdk

  module Saas

    module V1Dot1

      class Balances < OSTSdk::Saas::Base

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
          @url_prefix = '/balances'
        end

        # Get balances details of user
        #
        # Returns:
        # response: (OSTSdk::Util::Result)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{get_id!(params)}", params)
        end

      end

    end

  end

end
