module OSTSdk

  module Saas

      class Transactions < OSTSdk::Saas::Base

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
          @url_prefix = '/users'
          @url_suffix = '/transactions'
        end

        # Execute company to user transaction
        #
        # Returns:
        #   response: (Hash)
        #
        def execute(params = {})
          http_helper.send_post_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}", params)
        end

        # Get transaction detail
        #
        # Returns:
        #   response: (Hash)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}/#{get_transaction_id!(params)}", params)
        end

        # List transactions of a user
        #
        # Returns:
        #   response: (Hash)
        #
        def get_list(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}", params)
        end

      end

    end

end
