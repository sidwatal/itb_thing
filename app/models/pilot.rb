# typed: true

class Pilot < ApplicationRecord
  validates_presence_of :name, :debug_name
  validates_uniqueness_of :name, :debug_name
end
