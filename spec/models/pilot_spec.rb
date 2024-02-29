# spec/models/pilot_spec.rb
require 'rails_helper'

RSpec.describe Pilot, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to have_db_column(:nickname).of_type(:string) }
    it { is_expected.to respond_to(:nickname) }
    it { is_expected.to have_db_column(:debug_name).of_type(:string) }
    it { is_expected.to respond_to(:debug_name) }
  end

  describe 'validations' do
    subject { build(:pilot) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:debug_name) }
    it { is_expected.to validate_uniqueness_of(:debug_name) }
  end
end
