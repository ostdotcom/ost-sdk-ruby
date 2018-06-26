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

        api_version = extract_api_version(params[:api_base_url])

        # Provide access to version specific API endpoints
        if api_version == ''
          # puts("You are using an deprecated version of OST API. Please update to the latest version.")
          @services = OSTSdk::Saas::V0::Services.new(params)
        elsif api_version == 'v1'
          @services = OSTSdk::Saas::V1::Services.new(params)
        elsif api_version == 'v1.1'
          @services = OSTSdk::Saas::V1Dot1::Services.new(params)
        else
          fail 'Api endpoint is invalid'
        end

      end

      def extract_api_version(api_base_url)

        api_version = ((api_base_url || '').split("/")[3] || '').downcase
        api_major_version = (api_version.split('.')[0] || '')

        return api_major_version

      end

    end

  end

end
