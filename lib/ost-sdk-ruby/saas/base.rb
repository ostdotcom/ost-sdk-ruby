module OSTSdk

  module Saas

    class Base

      include OSTSdk::Util::ServicesHelper

      attr_reader :http_helper

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #   api_spec: (Boolean)
      #
      def initialize(environment, credentials, api_spec)

        fail 'missing param environment' if environment.nil?
        fail 'missing/invalid param credentials' if credentials.nil? ||
            credentials.class != OSTSdk::Util::APICredentials

        @http_helper = OSTSdk::Util::HTTPHelper.new(environment, credentials, api_spec)

      end

    end

  end

end
