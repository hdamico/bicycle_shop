# == Schema Information
#
# Table name: saddles
#
#  id         :bigint           not null, primary key
#  bicycle_id :bigint           not null
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_saddles_on_bicycle_id  (bicycle_id)
#
require 'rails_helper'

RSpec.describe Saddle, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:bicycle) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:color) }
  end
end
