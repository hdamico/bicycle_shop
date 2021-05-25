# == Schema Information
#
# Table name: wheels
#
#  id         :bigint           not null, primary key
#  bicycle_id :bigint
#  size       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_wheels_on_bicycle_id  (bicycle_id)
#  index_wheels_on_size        (size)
#
require 'rails_helper'

RSpec.describe Wheel, type: :model do
  subject { create(:wheel) }

  describe 'associations' do
    it { is_expected.to have_one(:rim).dependent(:destroy) }
    it { is_expected.to belong_to(:bicycle) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:size) }
    it { expect(subject).to validate_uniqueness_of(:size) }
  end
end
