module OSTSdk

  module Util

    class Result

      attr_accessor :error,
                    :error_message,
                    :error_display_text,
                    :error_display_heading,
                    :error_data,
                    :message,
                    :data,
                    :exception,
                    :http_code

      # Initialize
      #
      # Arguments:
      #   params: (Hash)
      def initialize(params = {})
        set_error(params)
        set_message(params[:message])
        set_http_code(params[:http_code])
        @data = params[:data] || {}
      end

      # Set Error
      #
      # Arguments:
      #   params: (Hash)
      def set_error(params)
        @error = params[:error] if params.key?(:error)
        @error_message = params[:error_message] if params.key?(:error_message)
        @error_data = params[:error_data] if params.key?(:error_data)
        @error_display_text = params[:error_display_text] if params.key?(:error_display_text)
        @error_display_heading = params[:error_display_heading] if params.key?(:error_display_heading)
      end

      # Set Message
      #
      # Arguments:
      #   msg: (String)
      def set_message(msg)
        @message = msg
      end

      # Set HTTP Code
      #
      # Arguments:
      #   msg: (String)
      def set_http_code(h_c)
        @http_code = h_c || 200
      end

      # Set Exception
      #
      # Arguments:
      #   e: (Exception)
      def set_exception(e)
        @exception = e
        @error_data = [
            {
                msg: e.message,
                trace: e.backtrace
            }
        ]
      end

      # is valid?
      #
      # @return [Boolean] returns True / False
      #
      def valid?
        !invalid?
      end

      # is invalid?
      #
      # @return [Boolean] returns True / False
      #
      def invalid?
        errors_present?
      end

      # Define error / failed methods
      #
      [:error?, :errors?, :failed?].each do |name|
        define_method(name) { invalid? }
      end

      # Define success method
      #
      [:success?].each do |name|
        define_method(name) { valid? }
      end

      # are errors present?
      #
      # @return [Boolean] returns True / False
      #
      def errors_present?
        @error ||
            @error_message ||
            @error_data ||
            @error_display_text ||
            @error_display_heading ||
            @exception
      end

      # Exception message
      #
      # Returns:
      #   exception_message: (String)
      #
      def exception_message
        @e_m ||= @exception.nil? ? '' : @exception.message
      end

      # Exception backtrace
      #
      # Returns:
      #   exception_backtrace: (String)
      #
      def exception_backtrace
        @e_b ||= @exception.nil? ? '' : @exception.backtrace
      end

      # Get instance variables Hash style from object
      #
      def [](key)
        instance_variable_get("@#{key}")
      end

      # Error
      #
      # Returns:
      #   obj: (OSTSdk::Util::Result)
      #
      def self.error(params)
        new(params)
      end

      # Success
      #
      # Returns:
      #   obj: (OSTSdk::Util::Result)
      #
      def self.success(params)
        new(params.merge!(no_error))
      end

      # Exception
      #
      # Returns:
      #   obj: (OSTSdk::Util::Result)
      #
      def self.exception(e, params = {})
        obj = new(params)
        obj.set_exception(e)
        return obj
      end

      # No Error
      #
      # Returns:
      #   obj: (Hash)
      #
      def self.no_error
        @n_err ||= {
            error: nil,
            error_message: nil,
            error_data: nil,
            error_display_text: nil,
            error_display_heading: nil
        }
      end

      # Fields
      #
      # Returns:
      #   obj: (Array)
      #
      def self.fields
        error_fields + [:data, :message]
      end

      # Error Fields
      #
      # Returns:
      #   obj: (Array)
      #
      def self.error_fields
        [
            :error,
            :error_message,
            :error_data,
            :error_display_text,
            :error_display_heading
        ]
      end

      # Create an Hash out of all instance vars
      #
      # Returns:
      #   obj: (Hash)
      #
      def to_hash
        self.class.fields.each_with_object({}) do |key, hash|
          val = send(key)
          hash[key] = val if !val.nil?
        end
      end

      # To JSON
      #
      # Returns:
      #   obj: (Hash)
      #
      def to_json

        hash = self.to_hash

        if (hash[:error] == nil)
          h = {
              success: true
          }.merge(hash)
          h
        else
          {
              success: false,
              err: {
                  code: hash[:error],
                  msg: hash[:error_message],
                  display_text: hash[:error_display_text].to_s,
                  display_heading: hash[:error_display_heading].to_s,
                  error_data: hash[:error_data] || []
              },
              data: hash[:data]
          }
        end

      end

    end
    
  end

end
