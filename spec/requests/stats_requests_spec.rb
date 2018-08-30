require "rails_helper"
require_relative "shared_request_examples"

describe Api::Stats::StatsController, type: :request do
  let!(:trip) { create(:trip, price: 4, distance: 8) }

  describe "GET #weekly" do
    subject { get api_stats_weekly_path }

    include_examples :has_status_code, 200
    include_examples :has_response_as_fields do
      let(:expected_fields) { %w(total_distance total_price) }
    end
    include_examples :has_proper_field_value, :total_distance, "8km"
    include_examples :has_proper_field_value, :total_price, "4.0PLN"
  end

  describe "GET #monthly" do
    let!(:second_trip) { create(:trip, price: 2, distance: 4) }
    subject { get api_stats_monthly_path }

    include_examples :has_status_code, 200
    include_examples :has_response_as_collection_of_fields do
      let(:expected_fields) { %w(day total_distance avg_ride avg_price) }
    end
    include_examples :has_proper_field_value_in_collection, :day, Date.today.strftime("%b, #{Date.today.day.ordinalize}")
    include_examples :has_proper_field_value_in_collection, :total_distance, "12km"
    include_examples :has_proper_field_value_in_collection, :avg_ride, "6km"
    include_examples :has_proper_field_value_in_collection, :avg_price, "3.0PLN"
  end
end
