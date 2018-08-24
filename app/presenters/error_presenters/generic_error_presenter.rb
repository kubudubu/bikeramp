module ErrorPresenters
  class GenericErrorPresenter < BaseErrorPresenter
    def present
      self.status = :bad_request
      self.errors = { errors: [@object.message] }
    end
  end
end
