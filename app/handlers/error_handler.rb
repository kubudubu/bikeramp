module ErrorHandler
  class << self
    HANDLERS = {
      "ActiveRecord::RecordInvalid": RecordInvalidHandler,
      "RouteNotFoundError": RouteNotFoundHandler,
    }.freeze

    def handle(exception)
      response = handler(exception)&.handle
      response.nil? ? default_handler(exception).handle : response
    end

    private

    def handler(exception)
      HANDLERS[exception.class.name.to_sym]&.new(exception)
    end

    def default_handler(exception)
      GenericErrorHandler.new(exception)
    end

  end
end
