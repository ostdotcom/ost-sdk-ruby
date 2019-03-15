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
        fail 'Api endpoint is invalid' if api_version != "v2"

        @services = OSTSdk::Saas::Manifest.new(params)
      end

      def extract_api_version(api_base_url)
        api_version = ((api_base_url || '').split("/")[4] || '').downcase
        return api_version
      end

    end

  end

end
