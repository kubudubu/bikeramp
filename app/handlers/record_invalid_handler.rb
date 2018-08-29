class RecordInvalidHandler < BaseErrorHandler
  def handle
    self.status = :unprocessable_entity
    self.errors = { errors: exception.record.errors.messages }
    self
  end
end
