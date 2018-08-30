require "rails_helper"
require_relative "shared_validations_examples"

describe Trip, type: :model do
  describe "factory" do
    include_examples :has_valid_factory, :trip
  end

  describe TripValidations do
    context "when distance is invalid" do
      include_examples :is_not_numericality, :trip, :distance
    end

    context "when price is invalid" do
      include_examples :is_not_numericality, :trip, :price
      include_examples :is_not_nil, :trip, :price
    end

    context "when date is invalid" do
      include_examples :is_not_date, :trip, :date
      include_examples :is_not_nil, :trip, :date
    end

    context "when start_address is invalid" do
      include_examples :is_not_address, :trip, :start_address
      include_examples :is_not_nil, :trip, :start_address
    end

    context "when destination_address is invalid" do
      include_examples :is_not_address, :trip, :destination_address
      include_examples :is_not_nil, :trip, :destination_address
    end
  end
end
