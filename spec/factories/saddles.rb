# == Schema Information
#
# Table name: saddles
#
#  id         :bigint           not null, primary key
#  bicycle_id :bigint           not null
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_saddles_on_bicycle_id  (bicycle_id)
#
FactoryBot.define do
  factory :saddle do
    color { Faker::Color.color_name }

    association :bicycle
  end
end
