module OSTSdk

  module Saas

    class RecoveryOwners < OSTSdk::Saas::Base

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
        @url_suffix = '/recovery-owners'
      end

      # Get Recovery Owner
      #
      # Returns:
      #   response: (Hash)
      #
      def get(params = {})
        http_helper.send_get_request("#{@url_prefix}/#{get_user_id!(params)}#{@url_suffix}/#{get_recovery_owner_address!(params)}", params)
      end

    end

  end

end