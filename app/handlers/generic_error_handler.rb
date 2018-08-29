class GenericErrorHandler < BaseErrorHandler
  def handle
    self.status = :bad_request
    self.errors = { errors: { message: [exception.message] } }
    self
  end
end
