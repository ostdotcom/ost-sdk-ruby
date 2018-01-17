module OSTSdk

  module Saas

    class TransactionKind < OSTSdk::Saas::Base

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #
      def initialize(environment, credentials)
        super
        @url_prefix = '/transaction/kind'
      end

      # Creates a new transaction type
      #
      def list
        http_helper.send_get_request("#{@url_prefix}/list", {})
      end

      # Creates a new transaction type
      #
      # @param [Hash] params (mandatory) is a Hash
      #
      def create(params)
        http_helper.send_post_request("#{@url_prefix}/create", params)
      end

      # Update a transaction type
      #
      # @param [Hash] params (mandatory) is a Hash
      #
      def update(params)
        http_helper.send_post_request("#{@url_prefix}/update", params)
      end

      # Delete a transaction type
      #
      # @param [Hash] params (mandatory) is a Hash
      #
      def delete(params)
        http_helper.send_post_request("#{@url_prefix}/delete", params)
      end

    end

  end

end
