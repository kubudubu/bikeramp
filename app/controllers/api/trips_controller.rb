class Api::TripsController < ApplicationController
  def create
    TripService.create(trip_params)
    head :no_content
  end

  private

  def trip_params
    params.permit(:start_address, :destination_address, :price, :date)
  end
end
