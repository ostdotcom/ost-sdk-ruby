module OSTSdk

  module Saas

    module V1

      class Users < OSTSdk::Saas::Base

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
          @url_prefix = '/users'
        end

        # Create a new user
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def create(params = {})
          http_helper.send_post_request("#{@url_prefix}/", params)
        end

        # Edit an existing user
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def edit(params = {})
          http_helper.send_post_request("#{@url_prefix}/#{get_id!(params)}", params)
        end

        # Fetches the list of users (with or without filters)
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def list(params = {})
          http_helper.send_get_request("#{@url_prefix}/", params)
        end

        # Get details about a user
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{get_id!(params)}", params)
        end

      end

    end

  end

end
