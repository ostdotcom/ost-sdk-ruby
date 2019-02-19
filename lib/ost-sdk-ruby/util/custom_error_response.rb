module OSTSdk

  module Util

    class CustomErrorResponse


      def initialize(params)
        @code = params[:code]
        @internal_id = params[:internal_id]
        @msg = params[:msg]
        @error_data = params[:error_data]
      end


      def external_error_response
        error_response({
                           :code => @code,
                           :internal_id => @internal_id,
                           :msg => @msg,
                           :error_data => @error_data
                       })
      end

      def default_error_response
        error_response({
                           :code => 'SOMETHING_WENT_WRONG',
                           :internal_id => "SDK(#{@internal_id})",
                           :msg => @msg,
                           :error_data => []
                       })
      end

      def timeout_error_response
        error_response({
                           :code => 'REQUEST_TIMEOUT',
                           :internal_id => "SDK(REQUEST_TIMEOUT)",
                           :msg => '',
                           :error_data => []
                       })
      end

      private

      def error_response(err)
        {
            success: false,
            err: err
        }
      end

    end

  end

end
