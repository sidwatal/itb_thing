class CreateRunPilots < ActiveRecord::Migration[7.1]
  def change
    create_table :run_pilots, id: :uuid do |t|
      t.references :run, null: false, foreign_key: true, type: :uuid
      t.references :pilot, null: false, foreign_key: true, type: :uuid
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
