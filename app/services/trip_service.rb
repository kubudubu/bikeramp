class TripService
  def self.create(params)
    trip = Trip.new(params)
    trip.calculate_distance
    trip.save!
  end
end
