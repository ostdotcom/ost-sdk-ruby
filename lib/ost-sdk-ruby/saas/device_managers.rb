module OSTSdk

  module Saas

      class DeviceManagers < OSTSdk::Saas::Base

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
          @url_suffix = '/device-managers'
        end

        # Get Device Manager Detail
        #
        # Returns:
        #   response: (Hash)
        #
        def get(params = {})
          http_helper.send_get_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}", params)
        end

      end

    end

end
