# typed: true

class Loop < ApplicationRecord
  # validations
  validates :profile_name, presence: true, uniqueness: true

  belongs_to :starting_pilot, class_name: 'Pilot'
end
