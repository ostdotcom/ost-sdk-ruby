module OSTSdk

  module Saas

    class Base

      include OSTSdk::Util::ServicesHelper

      attr_reader :http_helper

      # Initialize
      #
      # Arguments:
      #   api_base_url: (String)
      #   api_key: (String)
      #   api_secret: (String)
      #   api_spec: (Boolean)
      #
      def initialize(params)

        fail 'missing API Base URL' if params[:api_base_url].nil?
        fail 'missing API Key' if params[:api_key].nil?
        fail 'missing API Secret' if params[:api_secret].nil?

        params[:api_base_url] = sanitize_api_base_url(params[:api_base_url])

        @http_helper = OSTSdk::Util::HTTPHelper.new(params)

      end

      private

      # Get id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   id: (String)
      #
      def get_id!(params)
        get_value_for_key!(params, "id")
      end

      # Get user_id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   user_id: (String)
      #
      def get_user_id!(params)
        get_value_for_key!(params, "user_id")
      end

      # Get webhook_id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   user_id: (String)
      #
      def get_webhook_id!(params)
        get_value_for_key!(params, "webhook_id")
      end

      # Get redemption_id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   redemption_id: (String)
      #
      def get_redemption_id!(params)
        get_value_for_key!(params, "redemption_id")
      end

      # Get redeemable_sku_id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   redeemable_sku_id: (String)
      #
      def get_redeemable_sku_id!(params)
        get_value_for_key!(params, "redeemable_sku_id")
      end

      # Get chain_id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   chain_id: (String)
      #
      def get_chain_id!(params)
        get_value_for_key!(params, "chain_id")
      end

      # Get device_address key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   device_address: (String)
      #
      def get_device_address!(params)
        get_value_for_key!(params, "device_address")
      end

      # Get session_address key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   session_address: (String)
      #
      def get_session_address!(params)
        get_value_for_key!(params, "session_address")
      end


      # Get transaction_id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   transaction_id: (String)
      #
      def get_transaction_id!(params)
        get_value_for_key!(params, "transaction_id")
      end

      # Get user_id key from params hash and delete it
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   user_id: (String)
      #
      def get_recovery_owner_address!(params)
        get_value_for_key!(params, "recovery_owner_address")
      end

      # Get value for specific key
      #
      # Arguments:
      #   params: (Hash)
      #
      # Returns:
      #   key: (String)
      #
      def get_value_for_key!(params, key)
        if params.has_key?(key.to_sym)
          value = params.delete(key.to_sym)
        elsif params.has_key?(key.to_s)
          value = params.delete(key.to_s)
        end

        raise "#{key.to_s} missing in request params" if value.nil?
        raise "#{key.to_s} invalid in request params" if !OSTSdk::Util::CommonValidator.is_valid_uuid_format?(value.to_s)
        value
      end

      # Sanitize API Base URL
      #
      # Arguments:
      #   params: (String)
      #
      # Returns:
      #   api_base_url: (String)
      #
      def sanitize_api_base_url(api_base_url)
        api_base_url = api_base_url.gsub(/\/$/, '') # remove trailing slash
        return api_base_url

      end

    end

  end

end
