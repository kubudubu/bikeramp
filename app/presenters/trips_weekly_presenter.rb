class TripsWeeklyPresenter < BasePresenter
  def as_json(*)
    {
      total_distance: 1,
      total_price: 2
    }
  end
end
