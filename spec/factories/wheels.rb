FactoryBot.define do
  factory :wheel do
    size { Faker::Number.number(digits: 2) }

    association :bicycle
  end
end
