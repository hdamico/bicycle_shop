require 'rails_helper'

RSpec.describe Saddle, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:bicycle) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:color) }
  end
end
