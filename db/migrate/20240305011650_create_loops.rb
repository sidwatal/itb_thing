class CreateLoops < ActiveRecord::Migration[7.1]
  def change
    create_table :loops, id: :uuid do |t|
      t.string :profile_name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
