class ErrorService
  def self.format(exception)
    case exception
    when ActiveRecord::RecordInvalid
      ErrorPresenters::RecordInvalidPresenter.new(exception)
    else
      ErrorPresenters::GenericErrorPresenter.new(exception)
    end
  end
end
