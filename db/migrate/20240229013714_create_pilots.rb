class CreatePilots < ActiveRecord::Migration[7.1]
  def change
    create_table :pilots do |t|
      t.string :name, null: false
      t.string :nickname
      t.string :debug_name

      t.timestamps
    end
  end
end
