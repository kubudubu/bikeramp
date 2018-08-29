FactoryBot.define do
  factory :trip do
    start_address { "Mazowiecka 9, Warszawa, Polska" }
    destination_address { "Mazowiecka 10, Warszawa, Polska" }
    price { 2.0 }
    distance { 10 }
    date { "2018-01-01" }
  end
end
