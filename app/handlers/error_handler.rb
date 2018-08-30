class ErrorHandler
  attr_reader :error_handlers

  def initialize
    @error_handlers ||= {
      "ActiveRecord::RecordInvalid": RecordInvalidHandler,
      "RouteNotFoundError": RouteNotFoundHandler,
    }
  end

  def handle(exception)
    response = handler(exception)&.handle
    response.nil? ? default_handler(exception).handle : response
  end

  private

  def handler(exception)
    error_handlers[exception.class.name.to_sym]&.new(exception)
  end

  def default_handler(exception)
    GenericErrorHandler.new(exception)
  end
end
