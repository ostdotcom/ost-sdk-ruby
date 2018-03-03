module OSTSdk

  module Util

    class HTTPHelper

      require "uri"
      require "open-uri"
      require "openssl"
      require "net/http"
      require "json"

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
          if @api_spec
            return OSTSdk::Util::Result.success({data: {request_uri: uri.to_s, request_type: 'POST', request_params: hash_to_query_string(r_params)}})
          else
            result = http.post(uri.path, hash_to_query_string(r_params))
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
          uri = URI(get_api_url(endpoint))
          uri.query = URI.encode_www_form(r_params)
          if @api_spec
            return OSTSdk::Util::Result.success({data: {request_uri: uri.to_s.split("?")[0], request_type: 'GET', request_params: hash_to_query_string(r_params)}})
          else
            result = Net::HTTP.get_response(uri)
            return format_response(result)
          end
        end
      end

      private

      def set_api_base_url(env)
        ost_sdk_saas_api_endpoint = ENV['CA_SAAS_API_ENDPOINT']
        if ost_sdk_saas_api_endpoint.present?
          @api_base_url =  ost_sdk_saas_api_endpoint
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
        str = endpoint + '::' + request_timestamp + '::' + format_request_params(request_params).to_json
        signature = generate_signature(str)
        {"request-timestamp" => request_timestamp, "signature" => signature, "api-key" => @api_key}
      end

      def generate_signature(string_to_sign)
        digest = OpenSSL::Digest.new('sha256')
        OpenSSL::HMAC.hexdigest(digest, @api_secret, string_to_sign)
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

      def format_request_params(request_params)
        sorted_array = request_params.sort {|a, b| a[0].downcase <=> b[0].downcase}
        sorted_hash = {}
        sorted_array.each do |element|
          value = element[1]
          value = value.to_s
          sorted_hash[element[0].to_s] = value
        end
        sorted_hash
      end

      def hash_to_query_string(hash)
        str_array = []
        hash.each do |k, v|
          str_array << "#{k}=#{v.to_s}"
        end
        str_array.join('&')
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
