module OSTSdk

  module Util

    module ServicesHelper

      # Method which is called in service perform and handle exceptions
      #
      def perform_and_handle_exceptions(err_code = 'swt', err_message = 'Something Went Wrong', &block)
        begin
          yield if block_given?
        rescue StandardError => se
          OSTSdk::Util::Result.exception(se, {error: err_code, error_message: err_message, data: @params} )
        end
      end

      # returns current time
      #
      # Returns:
      #   Time
      #
      def current_time
        @c_time ||= Time.now
      end

      # returns current timestamp
      #
      # Returns:
      #   Integer
      #
      def current_timestamp
        @c_tstamp ||= current_time.to_f
      end

      # Success
      #
      # Returns:
      #   OSTSdk::Util::Result
      #
      def success
        success_with_data({})
      end

      # Success with data
      #
      # Arguments:
      #   data: (Hash)
      #
      # Returns:
      #   OSTSdk::Util::Result
      #
      def success_with_data(data)

        # Allow only Hash data to pass ahead
        data = {} unless Util::CommonValidator.is_a_hash?(data)

        OSTSdk::Util::Result.success({data: data})

      end

      # Error with data
      #
      # Arguments:
      #   code: (String)
      #   msg: (String)
      #   data: (Hash)
      #
      # Returns:
      #   OSTSdk::Util::Result
      #
      def error_with_data(code, msg, data = {})

        OSTSdk::Util::Result.error(
            {
                error: code,
                error_message: msg,
                data: data
            }
        )

      end

      #
      # Exception with data and wthout action
      #
      # Arguments:
      #   e: (Exception)
      #   code: (String)
      #   msg: (String)
      #   data: (Hash optional)
      #
      # Returns:
      #   OSTSdk::Util::Result
      #
      def exception_with_data(e, code, msg, data = {})

        OSTSdk::Util::Result.exception(
            e, {
            error: code,
            error_message: msg,
            data: data
          }
        )

      end

    end

  end

end
