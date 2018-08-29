require "rails_helper"
require_relative "shared_request_examples"

describe Api::Stats::StatsController, type: :request do
  describe "GET #weekly" do
    subject { get api_stats_weekly_path }
    include_examples :returns_status_code, 200 do
      let(:request) { subject }
    end
  end

  describe "GET #monthly" do
    subject { get api_stats_monthly_path }
    include_examples :returns_status_code, 200 do
      let(:request) { subject }
    end
  end

end
