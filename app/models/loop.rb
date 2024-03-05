class Loop < ApplicationRecord
  # validations
  validates :profile_name, presence: true, uniqueness: true

  # associations
  belongs_to :starting_pilot, class_name: 'Pilot'

  has_many :runs
  has_many :run_pilots, through: :runs
  has_many :pilots, through: :run_pilots
end
