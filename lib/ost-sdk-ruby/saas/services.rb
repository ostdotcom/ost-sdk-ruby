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
        if int_api_version >= v1dot2_int_api_version
          fail 'Unsupported API Version. Please check for new versions of SDK.'
        elsif int_api_version >= v1dot1_int_api_version
          @services = OSTSdk::Saas::V1Dot1::Services.new(params)
        elsif int_api_version >= v1_int_api_version
          @services = OSTSdk::Saas::V1::Services.new(params)
        else
          # puts("You are using an deprecated version of OST API. Please update to the latest version.")
          @services = OSTSdk::Saas::V0::Services.new(params)
        end

      end

      def extract_integer_api_version(api_base_url)

        api_version = ((api_base_url || '').split("/")[3] || '').downcase
        return v0_int_api_version if api_version == ''

        # version if passed should always start with 'v'
        fail "invalid version string #{api_version}" if api_version[0] != 'v'

        # exclude 'v'
        str_api_version = api_version[1..-1]

        regex_match_rsp = /^(\d{1,3})\.?(\d{0,3})\.?(\*|\d{0,3})$/.match(str_api_version)
        fail "invalid version string #{api_version}" if regex_match_rsp.nil?

        int_api_version = 0

        # add API major version
        int_api_version += regex_match_rsp[1].to_i * 1000000

        # add API minor version
        int_api_version += (regex_match_rsp[2] == '' ? 0 : regex_match_rsp[2].to_i * 1000)

        # add API Patch Version
        int_api_version += (regex_match_rsp[3] == '' ? 0 : regex_match_rsp[3].to_i)

        return int_api_version

      end

      def v0_int_api_version
        0
      end

      def v1_int_api_version
        1000000
      end

      def v1dot1_int_api_version
        1001000
      end

      def v1dot2_int_api_version
        1002000
      end

    end

  end

end
