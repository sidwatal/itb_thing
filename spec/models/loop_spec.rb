require 'rails_helper'

RSpec.describe Loop, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:profile_name).of_type(:string) }
  end

  describe 'validations' do
    subject { build(:loop) }

    it { is_expected.to validate_presence_of(:profile_name) }
    it { is_expected.to validate_uniqueness_of(:profile_name) }
  end
end