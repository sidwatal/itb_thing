# typed: true

class Run < ApplicationRecord
  include AASM
  belongs_to :loop

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :current
    state :completed
  end

  aasm column: :result, enum: true do
    state :unknown, initial: true
    state :victory
    state :defeat
  end
end
