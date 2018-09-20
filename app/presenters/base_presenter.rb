class BasePresenter
  UNITS = { km: 1, m: 1000 }

  def initialize(object, unit)
    @object = object
    @unit = unit || "km"
  end

  def parse_date(date)
    date.strftime("%b, #{date.day.ordinalize}")
  end

  def parse_price(price)
    "#{price ? price.round(2) : 0}PLN"
  end

  def parse_distance(distance)
    result = distance * UNITS[@unit.to_sym]
    "#{result&.round(0).to_i}#{@unit}"
  end

end
