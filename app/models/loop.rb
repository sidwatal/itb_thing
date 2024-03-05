class Loop < ApplicationRecord
  validates_presence_of :profile_name
  validates_uniqueness_of :profile_name
end
