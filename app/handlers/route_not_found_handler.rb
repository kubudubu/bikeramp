class RouteNotFoundHandler < BaseErrorHandler
  def handle
    self.status = :not_found
    self.errors = { errors: { message: [exception.message] }}
    self
  end
end
