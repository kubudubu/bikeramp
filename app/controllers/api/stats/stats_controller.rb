class Api::Stats::StatsController < ApplicationController
  def weekly
    respond(TripsWeeklyPresenter.new(Trip.weekly[0], weekly_params[:unit]))
  end

  def monthly
    respond(TripsMonthlyPresenter.new(Trip.monthly, weekly_params[:unit]))
  end

  private

  def weekly_params
    params.permit(:unit)
  end
end
