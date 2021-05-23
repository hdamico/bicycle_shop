FactoryBot.define do
  factory :rim do
    color { Faker::Color.color_name }

    association :wheel
  end
end
