class RunPilot < ApplicationRecord
  belongs_to :run
  belongs_to :pilot

  enum status: { inactive: 0, engaged: 1, deceased: 2 }
end
