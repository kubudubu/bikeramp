class TripsWeeklyPresenter < BasePresenter
  def as_json(*)
    {
      total_distance: parse_distance(@object.try(:total_distance)),
      total_price: parse_price(@object.try(:total_price))
    }
  end
end
