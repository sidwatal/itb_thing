class Battle < ApplicationRecord
  # associations
  belongs_to :run

  # callbacks
  before_create :set_name

  private

  def set_name
    return if name.present?

    self.name = "#{run.loop.profile_name}_#{run.number}"
  end
end
