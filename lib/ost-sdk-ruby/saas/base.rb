module OSTSdk

  module Saas

    class Base

      include OSTSdk::Util::ServicesHelper

      attr_reader :http_helper

      # Initialize
      #
      # @param [Hash] params (mandatory) is a Hash
      #
      def initialize(environment, credentials)

        fail 'missing param environment' if environment.nil?
        fail 'missing/invalid param credentials' if credentials.nil? ||
            credentials.class != OSTSdk::Util::APICredentials

        @http_helper = OSTSdk::Util::HTTPHelper.new(environment, credentials)

      end

    end

  end

end
