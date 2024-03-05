class Loop < ApplicationRecord
  # validations
  validates :profile_name, presence: true, uniqueness: true

  # associations
  belongs_to :starting_pilot, class_name: 'Pilot'
end
