class Api::Stats::StatsController < ApplicationController
  def monthly
    respond(TripsMonthlyPresenter.new({}))
  end

  def weekly
    respond(TripsWeeklyPresenter.new({}))
  end
end
