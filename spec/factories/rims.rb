# == Schema Information
#
# Table name: rims
#
#  id         :bigint           not null, primary key
#  wheel_id   :bigint           not null
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_rims_on_wheel_id  (wheel_id)
#
FactoryBot.define do
  factory :rim do
    color { Faker::Color.color_name }

    association :wheel
  end
end
