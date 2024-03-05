require 'rails_helper'

RSpec.describe Loop, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:profile_name).of_type(:string) }
    it { is_expected.to have_db_column(:starting_pilot_id).of_type(:uuid) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:starting_pilot).class_name('Pilot') }
  end

  describe 'validations' do
    subject { build(:loop) }

    it { is_expected.to validate_presence_of(:profile_name) }
    it { is_expected.to validate_uniqueness_of(:profile_name) }
  end
end
