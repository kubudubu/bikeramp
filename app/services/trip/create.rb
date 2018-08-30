class Trip::Create
  include Callable
  attr_accessor :trip

  def initialize(params)
   @trip = Trip.new(params)
  end

  def call
    trip.calculate_distance
    trip.save!
    trip
  end
end
