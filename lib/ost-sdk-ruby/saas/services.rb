module OSTSdk

  module Saas

    class Services

      attr_reader :services

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

        params[:api_base_url] = params[:api_base_url].gsub(/\/$/, '') # remove trailing slash
        params[:api_spec] = false if params[:api_spec].nil?

        set_manifest(params)

      end

      private

      def set_manifest(params)

        int_api_version = extract_integer_api_version(params[:api_base_url])

        # Provide access to version specific API endpoints
        if int_api_version == v0_int_api_version
          # puts("You are using an deprecated version of OST API. Please update to the latest version.")
          @services = OSTSdk::Saas::V0::Services.new(params)
        elsif int_api_version == v1_int_api_version
          @services = OSTSdk::Saas::V1::Services.new(params)
        elsif int_api_version < v2_int_api_version
          @services = OSTSdk::Saas::V1Dot1::Services.new(params)
        else
          fail 'Api endpoint is invalid'
        end

      end

      def extract_integer_api_version(api_base_url)

        api_version = ((api_base_url || '').split("/")[3] || '').downcase
        return v0_int_api_version if api_version == ''

        # version if passed should always start with 'v'
        fail "invalid version string #{api_version}" if api_version[0] != 'v'

        # exclude 'v'
        str_api_version = api_version[1..-1]

        # if str_api_version doesn't start with a integer value fail
        fail "invalid version string #{api_version}" if str_api_version.to_i == 0

        buffer = str_api_version.split('.')

        # version can not have more than 2 '.' ie 1.1.1.2 is not allowed
        fail "invalid version string #{api_version}" if buffer.length > 3

        buffer[0].to_i * 100 + (buffer[1] || 0).to_i * 10 + (buffer[2] || 0).to_i

      end

      def v0_int_api_version
        0
      end

      def v1_int_api_version
        100
      end

      def v2_int_api_version
        200
      end

    end

  end

end
