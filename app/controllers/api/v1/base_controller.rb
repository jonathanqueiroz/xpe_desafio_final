module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

      private

      def not_found
        render json: { error: 'Record not found' }, status: :not_found
      end

      def record_invalid(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
