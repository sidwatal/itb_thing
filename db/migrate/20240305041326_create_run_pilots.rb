class CreateRunPilots < ActiveRecord::Migration[7.1]
  def change
    create_table :run_pilots, id: :uuid do |t|
      t.timestamps
    end
  end
end
