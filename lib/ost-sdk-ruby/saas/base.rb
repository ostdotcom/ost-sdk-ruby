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
      #   id: (Integer)
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

        version_str = api_base_url.split('/')[-1]

        return api_base_url unless version_str.include?('v')

        buffer = version_str.split('.')
        if buffer.length == 3 # dot count in version == 2 ie. version had a patch version ex. v1.0.0
          regex_match_rsp = /^(.+)(\.\d{1,3})(\/{0,1})$/.match(api_base_url)
          api_base_url = regex_match_rsp[1]
        end

        return api_base_url

      end

    end

  end

end
