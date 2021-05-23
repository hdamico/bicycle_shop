class Wheel < ApplicationRecord
  belongs_to :bicycle
  has_one :rim, dependent: :destroy

  validates :size, uniqueness: true, presence: true
end
