FactoryGirl.define do
  sequence(:model) do |n|
      "Ferarri #{n}"
    end

  factory :car do
    manufacturer
    mileage 100000
    year 1990
    color 'blue'
    model
    description "best description for a car"
  end
end
