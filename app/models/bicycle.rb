class Bicycle < ApplicationRecord
  has_many :wheels, dependent: :destroy
  has_many :saddles, dependent: :destroy
end
