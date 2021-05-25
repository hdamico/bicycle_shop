# == Schema Information
#
# Table name: wheels
#
#  id         :bigint           not null, primary key
#  bicycle_id :bigint
#  size       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_wheels_on_bicycle_id  (bicycle_id)
#  index_wheels_on_size        (size)
#
FactoryBot.define do
  factory :wheel do
    size { Faker::Number.number(digits: 2) }

    association :bicycle
  end
end
