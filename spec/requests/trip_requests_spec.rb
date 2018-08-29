require 'rails_helper'
require_relative "shared_request_examples"

describe Api::TripsController, type: :request do
  describe "POST #create" do
    context "when params are valid" do
      subject { post api_trips_path, params: attributes_for(:trip) }

      include_examples :returns_status_code, 204 do
        let(:request) { subject }
      end

      include_examples :change_objects_size_by, 1, Trip do
        let(:request) { subject }
      end

      it "returns empty body" do
        subject
        expect(controller.response.body).to eq("")
      end
    end

    context "when params are invalid" do
      subject { post api_trips_path, params: {} }

      include_examples :returns_status_code, 422 do
        let(:request) { subject }
      end

      include_examples :change_objects_size_by, 0, Trip do
        let(:request) { subject }
      end

      include_examples :has_error_messages do
        let(:request) { subject }
      end
    end
  end
end
