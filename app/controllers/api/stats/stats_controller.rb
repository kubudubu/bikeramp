class Api::Stats::StatsController < ApplicationController
  def weekly
    respond(TripsWeeklyPresenter.new(Trip.weekly[0]))
  end

  def monthly
    respond(TripsMonthlyPresenter.new(Trip.monthly))
  end
end
