require 'rails_helper'

RSpec.describe RunPilot, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:status).of_type(:integer) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:run) }
    it { is_expected.to belong_to(:pilot) }
  end
end
