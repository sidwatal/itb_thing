class CreatePilots < ActiveRecord::Migration[7.1]
  def change
    create_table :pilots, id: :uuid  do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :nickname
      t.string :debug_name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
