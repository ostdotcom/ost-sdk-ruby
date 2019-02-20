module OSTSdk

  module Saas

    class Users < OSTSdk::Saas::Base

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
      end

      # Create a User
      #
      # Returns:
      #   response: (Hash)
      #
      def create(params = {})
        http_helper.send_post_request("#{@url_prefix}/", params)
      end

      # List Users
      #
      # Returns:
      #   response: (Hash)
      #
      def get_list(params = {})
        http_helper.send_get_request("#{@url_prefix}/", params)
      end

      # Get user details
      #
      # Returns:
      #   response: (Hash)
      #
      def get(params = {})
        http_helper.send_get_request("#{@url_prefix}/#{get_id!(params)}", params)
      end

    end

  end

end
