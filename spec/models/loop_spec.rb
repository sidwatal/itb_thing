require 'rails_helper'

RSpec.describe Loop, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:profile_name).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:starting_pilot).class_name('Pilot') }
    it { is_expected.to have_many(:runs) }
    it { is_expected.to have_many(:run_pilots).through(:runs) }
    it { is_expected.to have_many(:pilots).through(:run_pilots) }
  end

  describe 'validations' do
    subject { build(:loop) }

    it { is_expected.to validate_presence_of(:profile_name) }
    it { is_expected.to validate_uniqueness_of(:profile_name) }
  end
end
