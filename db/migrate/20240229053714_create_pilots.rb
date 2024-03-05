class CreatePilots < ActiveRecord::Migration[7.1]
  def change
    create_table :pilots, id: :uuid  do |t|
      t.string :name, null: false
      t.string :nickname
      t.string :debug_name

      t.timestamps
    end
  end
end
