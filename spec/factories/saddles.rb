FactoryBot.define do
  factory :saddle do
    color { Faker::Color.color_name }

    association :bicycle
  end
end
