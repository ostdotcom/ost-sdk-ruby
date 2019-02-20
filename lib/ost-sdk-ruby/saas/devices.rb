module OSTSdk

  module Saas

    class Devices < OSTSdk::Saas::Base

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
        @url_suffix = '/devices'
      end

      # Associate a Device with a User
      #
      # Returns:
      #   response: (Hash)
      #
      def create(params = {})
        http_helper.send_post_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}", params)
      end

      # List devices of a user
      #
      # Returns:
      #   response: (Hash)
      #
      def get_list(params = {})
        http_helper.send_get_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}", params)
      end

      # Get device of a user
      #
      # Returns:
      #   response: (Hash)
      #
      def get_device(params = {})
        http_helper.send_get_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}/#{get_device_address!(params)}",
                                     params)
      end


    end

  end

end