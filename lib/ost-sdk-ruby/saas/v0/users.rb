module OSTSdk

  module Saas

    module V0

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
          http_helper.send_post_request("#{@url_prefix}/create", params)
        end

        # Edit an existing user
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def edit(params = {})
          http_helper.send_post_request("#{@url_prefix}/edit", params)
        end

        # Fetches the list of all users
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def list(params = {})
          http_helper.send_get_request("#{@url_prefix}/list", params)
        end

        # Airdrop Branded Token to list of users
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def airdrop_tokens(params = {})
          http_helper.send_post_request("#{@url_prefix}/airdrop/drop", params)
        end

        # Get status of an Airdrop request for users.
        #
        # Returns:
        #   response: (OSTSdk::Util::Result)
        #
        def get_airdrop_status(params = {})
          http_helper.send_get_request("#{@url_prefix}/airdrop/status", params)
        end

      end

    end

  end

end
