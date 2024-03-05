require 'rails_helper'

RSpec.describe Loop, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:profile_name).of_type(:text) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:profile_name) }
    it { is_expected.to validate_uniqueness_of(:profile_name) }
  end
end
