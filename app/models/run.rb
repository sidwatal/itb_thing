class Run < ApplicationRecord
  belongs_to :loop

  enum status: { pending: 0, in_progress: 1, completed: 2, failed: 3 }
  enum result: { unknown: 0, victory: 1, defeat: 2 }
end
