require 'rails_helper'

RSpec.describe Battle, type: :model do
  describe 'fields' do
    describe 'name' do
      subject { create(:battle, name: nil) }

      it { is_expected.to have_db_column(:name).of_type(:string) }

      it 'is set before creation' do
        expect(subject.name).to eq("#{subject.run.loop.profile_name}_#{subject.run.number}")
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:run) }
  end
end
