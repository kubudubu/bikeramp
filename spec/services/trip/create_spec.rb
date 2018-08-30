require "rails_helper"
require_relative "../shared_service_examples"

describe Trip::Create do
  describe "call" do
    context "when params are valid" do
      let(:params) { attributes_for(:trip)}
      subject { described_class.call(params) }

      include_examples :creates_object, Trip

      it "calculates distance field" do
        expect(subject.distance).not_to eq nil
      end
    end

    context "when params are invalid" do
      subject { described_class.call({}) }
      include_examples :raises_error, ActiveRecord::RecordInvalid
    end
  end
end
