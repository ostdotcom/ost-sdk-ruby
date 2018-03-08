module OSTSdk

  module Util

    class HTTPHelper

      require "uri"
      require "open-uri"
      require "openssl"
      require "net/http"
      require "json"
      require 'rack'

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #   api_spec: (Boolean)
      #
      def initialize(environment, credentials, api_spec)
        set_api_base_url(environment)
        @api_key = credentials.api_key
        @api_secret = credentials.api_secret
        @api_spec = api_spec
      end

      # Send POST requests
      #
      # Arguments:
      #   end_point: (String)
      #   request_params: (Hash)
      #
      # Returns:
      #   OSTSdk::Util::Result
      #
      def send_post_request(endpoint, request_params)
        perform_and_handle_exceptions('u_hh_1', 'POST request failed') do
          base_params = get_base_params(endpoint, request_params)
          uri = post_api_uri(endpoint)
          http = setup_request(uri)
          r_params = base_params.merge(request_params)
          query_string = Rack::Utils.build_nested_query(r_params)
          escaped_query_string = URI.escape(query_string, '*')
          if @api_spec
            return OSTSdk::Util::Result.success({data: {request_uri: uri.to_s, request_type: 'POST', request_params: escaped_query_string}})
          else
            result = http.post(uri.path, escaped_query_string)
            return format_response(result)
          end
        end
      end

      # Send GET requests
      #
      # Arguments:
      #   end_point: (String)
      #   request_params: (Hash)
      #
      # Returns:
      #   OSTSdk::Util::Result
      #
      def send_get_request(endpoint, request_params)
        perform_and_handle_exceptions('u_hh_2', 'GET request Failed') do
          base_params = get_base_params(endpoint, request_params)
          r_params = base_params.merge(request_params)
          query_string = Rack::Utils.build_nested_query(r_params)
          escaped_query_string = URI.escape(query_string, '*')
          raw_url = get_api_url(endpoint) + "?" + escaped_query_string
          uri = URI(raw_url)
          if @api_spec
            return OSTSdk::Util::Result.success({data: {request_uri: uri.to_s.split("?")[0], request_type: 'GET', request_params: escaped_query_string}})
          else
            result = {}
            Timeout.timeout(5) do
              result = Net::HTTP.get_response(uri)
            end
            return format_response(result)
          end
        end
      end

      private

      def set_api_base_url(env)
        ost_sdk_saas_api_endpoint = ENV['CA_SAAS_API_ENDPOINT']
        if !ost_sdk_saas_api_endpoint.nil?
          @api_base_url = ost_sdk_saas_api_endpoint
        else
          case env
            when 'sandbox'
              @api_base_url = 'https://sandboxapi.ost.com'
            when 'main'
              @api_base_url = 'https://api.ost.com'
            else
              fail "unrecognized ENV #{env}"
          end
        end
      end

      def setup_request(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.read_timeout = 5
        http.open_timeout = 5
        if uri.scheme == "https"
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        http
      end

      def get_base_params(endpoint, request_params)
        request_timestamp = Time.now.to_i.to_s
        request_params = request_params.merge("request_timestamp" => request_timestamp, "api_key" => @api_key)

        sorted_request_params = sort_param(request_params)
        request_params_str = Rack::Utils.build_nested_query(sorted_request_params)
        request_params_escaped_str = URI.escape(request_params_str, "*")

        str = endpoint + '?' + request_params_escaped_str
        signature = generate_signature(str)
        {"request_timestamp" => request_timestamp, "signature" => signature, "api_key" => @api_key}
      end

      def generate_signature(string_to_sign)
        digest = OpenSSL::Digest.new('sha256')
        signature = OpenSSL::HMAC.hexdigest(digest, @api_secret, string_to_sign)
        signature
      end

      def post_api_uri(endpoint)
        URI(@api_base_url + endpoint)
      end

      def get_api_url(endpoint)
        @api_base_url + endpoint
      end

      # Method which is called in service perform and handle exceptions
      #
      def perform_and_handle_exceptions(err_code = 'swt', err_message = 'Something Went Wrong', &block)
        begin
          yield if block_given?
        rescue StandardError => se
          OSTSdk::Util::Result.exception(se, {error: err_code, error_message: err_message})
        end
      end

      def sort_param(params)

        if [Hash, Array].include?(params.class)
          params = JSON.parse(params.to_json)
        else
          params = params.to_s
        end

        res = {}
        if params.class == Array
          data = []
          params.each do |ele|
            if [Hash, Array].include?(ele.class)
              data << sort_param(ele)
            else
              data << ele.to_s
            end
          end
          return data
        end

        params.sort.each do |ele|
          key = ele[0]
          val = ele[1]
          sorted_val = val

          if [Hash, Array].include?(val.class)
            sorted_val = sort_param(val)
          else
            sorted_val = sorted_val.to_s
          end

          res[key] = sorted_val
        end
        return res
      end

      def format_response(response)
        response.code == '200' ? format_success_response(response.body) : format_failure_response(response.code)
      end

      def format_success_response(raw_response)
        json_raw_response = JSON.parse(raw_response)
        if json_raw_response['success']
          OSTSdk::Util::Result.success({data: json_raw_response['data']})
        else
          err_data = json_raw_response['err']
          OSTSdk::Util::Result.error(
              {
                  error: err_data['code'],
                  error_message: err_data['msg'],
                  error_data: err_data['error_data']
              }
          )
        end
      end

      def format_failure_response(response_code)
        OSTSdk::Util::Result.error(
            {
                error: response_code,
                error_message: 'Non 200 HTTP Status',
                http_code: response_code
            }
        )
      end

    end

  end

end
