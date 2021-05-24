# == Schema Information
#
# Table name: bicycles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bicycle < ApplicationRecord
  has_many :wheels, dependent: :destroy
  has_many :saddles, dependent: :destroy
end
