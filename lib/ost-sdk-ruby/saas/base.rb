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

        params[:api_base_url].gsub!(/\/$/, '') # remove trailing slash

        @http_helper = OSTSdk::Util::HTTPHelper.new(params)

      end

    end

  end

end
