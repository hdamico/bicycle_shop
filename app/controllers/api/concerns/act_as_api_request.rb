module Api
  module Concerns
    module ActAsApiRequest
      extend ActiveSupport::Concern

      included do
        before_action :skip_session_storage
        before_action :check_json_request
      end

      def check_json_request
        return if !request_with_body? || request_content_type.match?(/json/)

        render json: { error: I18n.t('api.errors.invalid_content_type') }, status: :not_acceptable
      end

      def skip_session_storage
        request.session_options[:skip] = true
      end

      def render_error(status, message, _data = nil)
        response = {
          error: message
        }
        render json: response, status: status
      end

      private

      def request_content_type
        request.content_type || ''
      end

      def request_with_body?
        request.post? || request.put? || request.patch?
      end
    end
  end
end
