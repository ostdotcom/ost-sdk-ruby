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
        if params.has_key?(:id)
          id = params[:id]
          params.delete(:id)
        elsif params.has_key?('id')
          id = params['id']
          params.delete('id')
        else
          fail "id missing in request params"
        end
        id
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
        if params.has_key?(:user_id)
          user_id = params[:user_id]
          params.delete(:user_id)
        elsif params.has_key?('user_id')
          user_id = params['user_id']
          params.delete('user_id')
        else
          fail "user_id missing in request params"
        end
        user_id
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
        if params.has_key?(:chain_id)
          chain_id = params[:chain_id]
          params.delete(:chain_id)
        elsif params.has_key?('chain_id')
          chain_id = params['chain_id']
          params.delete('chain_id')
        else
          fail "chain_id missing in request params"
        end
        chain_id
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
        if params.has_key?(:device_address)
          device_address = params[:device_address]
          params.delete(:device_address)
        elsif params.has_key?('device_address')
          device_address = params['device_address']
          params.delete('device_address')
        else
          fail "device_address missing in request params"
        end
        device_address
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
        if params.has_key?(:session_address)
          session_address = params[:session_address]
          params.delete(:session_address)
        elsif params.has_key?('session_address')
          session_address = params['session_address']
          params.delete('session_address')
        else
          fail "session_address missing in request params"
        end
        session_address
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
        if params.has_key?(:transaction_id)
          transaction_id = params[:transaction_id]
          params.delete(:transaction_id)
        elsif params.has_key?('transaction_id')
          transaction_id = params['transaction_id']
          params.delete('transaction_id')
        else
          fail "transaction_id missing in request params"
        end
        transaction_id
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
        if params.has_key?(:recovery_owner_address)
          recovery_owner_address = params[:recovery_owner_address]
          params.delete(:recovery_owner_address)
        elsif params.has_key?('recovery_owner_address')
          recovery_owner_address = params['recovery_owner_address']
          params.delete('recovery_owner_address')
        else
          fail "recovery_owner_address missing in request params"
        end
        recovery_owner_address
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
