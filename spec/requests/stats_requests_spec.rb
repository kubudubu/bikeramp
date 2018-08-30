require "rails_helper"
require_relative "shared_request_examples"

describe Api::Stats::StatsController, type: :request do
  let!(:trip) { create(:trip, date: Date.today) }

  describe "GET #weekly" do
    subject { get api_stats_weekly_path }

    include_examples :has_status_code, 200 do
      let(:request) { subject }
    end

    include_examples :has_response_as_fields do
      let(:request) { subject }
      let(:expected_fields) { %w(total_distance total_price) }
    end
  end

  describe "GET #monthly" do
    subject { get api_stats_monthly_path }

    include_examples :has_status_code, 200 do
      let(:request) { subject }
    end

    include_examples :has_response_as_collection_of_fields do
      let(:request) { subject }
      let(:expected_fields) { %w(day total_distance avg_ride avg_price) }
    end
  end
end
