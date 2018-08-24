require 'rails_helper'

describe Api::TripsController, type: :request do
  describe 'when POST # create' do
    it 'should return 204 code' do
      post api_trips_path
      expect(response).to have_http_status(:no_content)
    end
  end
end
