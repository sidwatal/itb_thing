class Run < ApplicationRecord
  # associations
  belongs_to :loop
  has_many :run_pilots
  has_many :pilots, through: :run_pilots

  enum status: { pending: 0, in_progress: 1, completed: 2, failed: 3 }
  enum result: { unknown: 0, victory: 1, defeat: 2 }
end
