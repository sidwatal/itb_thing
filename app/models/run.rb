class Run < ApplicationRecord
  # associations
  belongs_to :loop
  has_many :run_pilots
  has_many :pilots, through: :run_pilots

  # enums
  enum status: { pending: 0, in_progress: 1, completed: 2, failed: 3 }
  enum result: { unknown: 0, victory: 1, defeat: 2 }

  # callbacks
  before_create :set_number

  private

  def set_number
    last_number = loop.runs.maximum(:number) || 0
    self.number = last_number + 1
  end
end
