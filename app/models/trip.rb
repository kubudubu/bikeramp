class Trip < ApplicationRecord
  validates :start_address, :destination_address, presence: true
  validates :price, numericality: true
  validates :date, date: true

  def calculate_distance
  #   TODO: implement me
  end
end
