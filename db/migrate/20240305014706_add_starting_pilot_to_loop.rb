class AddStartingPilotToLoop < ActiveRecord::Migration[7.1]
  def change
    add_reference :loops, :starting_pilot, type: :uuid, foreign_key: { to_table: :pilots }
  end
end
