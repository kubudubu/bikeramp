class ApplicationController < ActionController::API
  rescue_from StandardError, with: :handle_error

  def handle_error(exception)
    result = error_handler.handle(exception)
    respond result.errors, result.status
  end

  def handle_routing_error
    handle_error(RouteNotFoundError.new(I18n.t("errors.handlers.route_not_found")))
  end

  def respond(object, status = :ok)
    render json: object, status: status
  end

  private

  def error_handler
    @error_handler ||= ErrorHandler.new
  end
end
