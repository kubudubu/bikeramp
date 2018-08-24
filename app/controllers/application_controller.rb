class ApplicationController < ActionController::API
  def respond(object, status = :ok)
    render json: object, status: status
  end
end
