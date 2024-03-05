class CreateRuns < ActiveRecord::Migration[7.1]
  def change
    create_table :runs, id: :uuid do |t|
      t.integer :number, null: false, default: 0
      t.references :loop, null: false, foreign_key: true, type: :uuid
      t.string :status, null: false
      t.string :result, null: false

      t.timestamps
    end
  end
end
