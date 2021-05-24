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
require 'rails_helper'

RSpec.describe Rim, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:wheel) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:color) }
  end
end
