require 'rails_helper'
require_relative "shared_request_examples"

describe Api::TripsController, type: :request do
  describe "POST #create" do
    context "when params are valid" do
      subject { post api_trips_path, params: attributes_for(:trip) }

      include_examples :has_status_code, 204 do
        let(:request) { subject }
      end

      include_examples :change_objects_size_by, 1, Trip do
        let(:request) { subject }
      end

      include_examples :has_empty_response_body do
        let(:request) { subject }
      end
    end

    context "when params are invalid" do
      subject { post api_trips_path, params: {} }

      include_examples :has_status_code, 422 do
        let(:request) { subject }
      end

      include_examples :change_objects_size_by, 0, Trip do
        let(:request) { subject }
      end

      include_examples :has_response_as_fields do
        let(:request) { subject }
        let(:expected_fields) { %w(errors) }
      end
    end
  end
end
