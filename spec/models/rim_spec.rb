require 'rails_helper'

RSpec.describe Rim, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:wheel) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:color) }
  end
end
