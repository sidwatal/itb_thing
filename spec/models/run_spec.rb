# spec/models/run_spec.rb
require 'rails_helper'

RSpec.describe Run, type: :model do
  describe 'fields' do
    describe 'number' do
      it { is_expected.to have_db_column(:number).of_type(:integer) }

      describe 'auto-incrementing' do
        let(:loop) { create(:loop) }
        let(:last_run) { create(:run, loop:) }

        before { create_list(:run, 4, loop:) }

        it 'the value' do
          expect(last_run.number).to eq(5)
        end
      end
    end

    it { is_expected.to have_db_column(:status).of_type(:string) }
    it { is_expected.to have_db_column(:result).of_type(:string) }
  end
end
