module OSTSdk

  module Saas

    class Users < OSTSdk::Saas::Base

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #
      def initialize(environment, credentials)
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
        http_helper.send_post_request("#{@url_prefix}/list", params)
      end

      # Airdrop Branded Token to list of users
      #
      # Returns:
      #   response: (OSTSdk::Util::Result)
      #
      def airdrop_tokens(params = {})
        http_helper.send_post_request("#{@url_prefix}/airdrop-tokens", params)
      end

    end

  end

end
