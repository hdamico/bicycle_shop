class Rim < ApplicationRecord
  belongs_to :wheel

  validates :color, presence: true
end
