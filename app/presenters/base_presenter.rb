class BasePresenter
  def initialize(object)
    @object = object
  end

  def parse_date(date)
    date.strftime("%b, #{date.day.ordinalize}")
  end

  def parse_price(price)
    "#{price ? price.round(2) : 0}PLN"
  end

  def parse_distance(distance)
    "#{distance ? distance.round(0) : 0}km"
  end

end
