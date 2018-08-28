class Trip < ApplicationRecord
  include TripValidations

  scope :current_week, -> { where("date >= ? and date <= ?", Date.today.beginning_of_week, Date.today.end_of_week) }
  scope :current_month, -> { where("date >= ? and date <= ?", Date.today.beginning_of_month, Date.today.end_of_month) }
  scope :weekly, -> { current_week.select("sum(price) as total_price, sum(distance) as total_distance") }
  scope :monthly, -> { current_month.group(:date).select("date, sum(distance) as total_distance, avg(distance) as avg_ride, avg(price) as avg_price") }

  def calculate_distance
   self.distance = Geocoder::Calculations.distance_between(start_address, destination_address)
  end
end
