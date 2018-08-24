class TripsMonthlyPresenter < BasePresenter
  def as_json(*)
    {
      day: 1,
      total_distance: 2,
      avg_ride: 3,
      avg_price: 4
    }
  end
end
