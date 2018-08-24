module ErrorPresenters
  class RecordInvalidPresenter < BaseErrorPresenter
    def present
      self.status = :unprocessable_entity
      self.errors = { errors: @object.record.errors.messages }
    end
  end
end
