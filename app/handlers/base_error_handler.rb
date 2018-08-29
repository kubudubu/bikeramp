class BaseErrorHandler
  attr_accessor :status, :errors, :exception

  def initialize(exception)
    @exception = exception
  end

  def handle
    raise I18n.t("errors.handlers.cannot_handle_base_error")
  end
end
