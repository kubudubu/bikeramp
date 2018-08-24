module ErrorPresenters
  class BaseErrorPresenter
    attr_accessor :status, :errors

    def initialize(object)
      @object = object
      present
    end

    def present
      raise "Can't present base error"
    end
  end
end
