class ApplicationController < ActionController::API
  rescue_from StandardError, with: :handle_error

  def handle_error(exception)
    result = ErrorService.format(exception)
    respond result.errors, result.status
  end

  def respond(object, status = :ok)
    render json: object, status: status
  end
end
