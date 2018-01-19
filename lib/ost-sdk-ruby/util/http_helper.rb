module OSTSdk

  module Util

    class HTTPHelper

      require "uri"
      require "open-uri"
      require "openssl"
      require "json"

      # Initialize
      #
      # Arguments:
      #   environment: (String)
      #   credentials: (OSTSdk::Util::APICredentials)
      #
      def initialize(environment, credentials)
        set_api_base_url(environment)
        @api_key = credentials.api_key
        @api_secret = credentials.api_secret
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
          result = http.post(uri.path, hash_to_query_string(r_params))
          OSTSdk::Util::Result.success({data: JSON.parse(result.body)})
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
          raw_url = get_api_url(endpoint) + "?#{hash_to_query_string(r_params)}"
          result = URI.parse(raw_url).read
          OSTSdk::Util::Result.success({data: JSON.parse(result)})
        end
      end

      private

      def set_api_base_url(env)
        case env
          when 'sandbox'
            @api_base_url = 'http://localhost:3000'
          when 'production'
            @api_base_url = ''
          else
            fail "unrecognized ENV #{env}"
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
        str = endpoint + '::' + request_timestamp + '::' + sort_hash(request_params).to_json
        signature = generate_signature(@api_secret, str)
        {"request-timestamp" => request_timestamp, "signature" => signature, "api-key" => @api_key}
      end

      def generate_signature(api_secret, string_to_sign)
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
          OSTSdk::Util::Result.exception(se, {error: err_code, error_message: err_message} )
        end
      end

      def sort_hash(request_params)
        sorted_array = request_params.sort {|a,b| a[0].downcase<=>b[0].downcase}
        sorted_hash = {}
        sorted_array.each do |element|
          sorted_hash[element[0]] = element[1]
        end
        sorted_hash
      end

      def hash_to_query_string(hash)
        str_array = []
        hash.each do |k,v|
          str_array << "#{k}=#{v.to_s}"
        end
        str_array.join('&')
      end

    end

  end

end
