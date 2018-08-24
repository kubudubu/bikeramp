class Api::Stats::StatsController < ApplicationController
  def monthly
    respond({method: :monthly})
  end

  def weekly
    respond({method: :weekly})
  end
end
