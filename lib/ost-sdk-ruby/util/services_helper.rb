module OSTSdk

  module Util

    module ServicesHelper

      # Wrapper Method which could be used to execute business logic
      # Error handling code wraps execution of business logic
      #
      # Arguments:
      #   err_code: (String)
      #   err_message: (String)
      #   block: (Proc)
      #
      # Returns:
      #   response: (Hash)
      #
      def perform_and_handle_exceptions(internal_id = 'swr', msg = 'Something Went Wrong', &block)
        begin
          yield if block_given?
        rescue StandardError => se
          OSTSdk::Util::CustomErrorResponse.new({internal_id: internal_id, msg: msg}).default_error_response
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

    end

  end

end
