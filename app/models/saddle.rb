class Saddle < ApplicationRecord
  belongs_to :bicycle

  validates :color, presence: true
end
