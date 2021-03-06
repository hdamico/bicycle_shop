# == Schema Information
#
# Table name: saddles
#
#  id         :bigint           not null, primary key
#  bicycle_id :bigint
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_saddles_on_bicycle_id  (bicycle_id)
#
class Saddle < ApplicationRecord
  belongs_to :bicycle, optional: true

  validates :color, presence: true
end
