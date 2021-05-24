# == Schema Information
#
# Table name: wheels
#
#  id         :bigint           not null, primary key
#  bicycle_id :bigint           not null
#  size       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_wheels_on_bicycle_id  (bicycle_id)
#  index_wheels_on_size        (size) UNIQUE
#
class Wheel < ApplicationRecord
  belongs_to :bicycle
  has_one :rim, dependent: :destroy

  validates :size, uniqueness: true, presence: true
end
