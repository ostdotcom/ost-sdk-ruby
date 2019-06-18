module OSTSdk

  module Saas

    class Webhooks < OSTSdk::Saas::Base

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
        @url_prefix = '/webhooks'
      end

      # Create a Webhook
      #
      # Returns:
      #   response: (Hash)
      #
      def create(params = {})
        http_helper.send_post_request("#{@url_prefix}/", params)
      end

      # Update a Webhook
      #
      # Returns:
      #   response: (Hash)
      #
      def update(params = {})
        http_helper.send_post_request("#{@url_prefix}/#{get_webhook_id!(params)}", params)
      end

      # Get webhook details
      #
      # Returns:
      #   response: (Hash)
      #
      def get(params = {})
        http_helper.send_get_request("#{@url_prefix}/#{get_webhook_id!(params)}", params)
      end

      # List Webhooks
      #
      # Returns:
      #   response: (Hash)
      #
      def get_list(params = {})
        http_helper.send_get_request("#{@url_prefix}/", params)
      end

      # Delete a Webhook
      #
      # Returns:
      #   response: (Hash)
      #
      def delete(params = {})
        http_helper.send_delete_request("#{@url_prefix}/#{get_webhook_id!(params)}", params)
      end

      # Verify webhook request signature
      #
      # Returns:
      #   response: (Boolean)
      #
      def verify_signature(params = {})
        version = params[:version]
        webhook_secret = params[:webhook_secret]
        stringified_data = params[:stringified_data]
        request_timestamp = params[:request_timestamp]
        signature = params[:signature]

        signature_params = "#{request_timestamp}.#{version}.#{stringified_data}"
        digest = OpenSSL::Digest.new('sha256')
        signature_to_be_verified = OpenSSL::HMAC.hexdigest(digest, webhook_secret, signature_params)

        signature == signature_to_be_verified

      end

    end

  end

end
