module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound, with: :four_zero_four

    rescue_from ActiveModel::ValidationError, with: :validation
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(e)
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def four_zero_four(e)
    render json: { message: e.message }, status: :not_found
  end

  def validation(e)
    render json: { message: e.message }, status: :unprocessable_entity
  end
end
