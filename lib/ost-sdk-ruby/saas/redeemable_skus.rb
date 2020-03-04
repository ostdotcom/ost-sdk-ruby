module OSTSdk

  module Saas

      class RedeemableSkus < OSTSdk::Saas::Base

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
          @url_prefix = '/redeemable-skus'
        end

        # Get redeemable sku detail
        #
        # Returns:
        #   response: (Hash)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{get_redeemable_sku_id!(params)}", params)
        end

        # List redeemable sku details
        #
        # Returns:
        #   response: (Hash)
        #
        def get_list(params = {})
          http_helper.send_get_request("#{@url_prefix}", params)
        end

      end

    end

end
