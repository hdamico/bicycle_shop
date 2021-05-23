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
