# typed: true

class Pilot < ApplicationRecord
  validates :name, :debug_name, presence: true, uniqueness: true
end
