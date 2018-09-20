require 'rails_helper'
require_relative "shared_request_examples"

describe Api::TripsController, type: :request do
  describe "POST #create" do
    context "when params are valid" do
      subject { post api_trips_path, params: attributes_for(:trip) }

      it_behaves_like :has_status_code, 204
      it_behaves_like :change_objects_size_by, 1, Trip
      it_behaves_like :has_empty_response_body
    end

    context "when params are invalid" do
      subject { post api_trips_path, params: {} }

      it_behaves_like :has_status_code, 422
      it_behaves_like :change_objects_size_by, 0, Trip
      it_behaves_like :has_response_as_fields do
        let(:expected_fields) { %w(errors) }
      end
    end
  end
end
