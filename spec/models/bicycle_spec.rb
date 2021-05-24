# == Schema Information
#
# Table name: bicycles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Bicycle, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:wheels).dependent(:destroy) }
    it { is_expected.to have_many(:saddles).dependent(:destroy) }
  end
end
