class TripsMonthlyPresenter < BasePresenter
  def as_json(*)
    @object.map do |day|
      {
        day: parse_date(day.date),
        total_distance: parse_distance(day.total_distance),
        avg_ride: parse_distance(day.avg_ride),
        avg_price: parse_price(day.avg_price)
      }
    end
  end
end
