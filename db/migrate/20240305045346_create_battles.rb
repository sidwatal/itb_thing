class CreateBattles < ActiveRecord::Migration[7.1]
  def change
    create_table :battles, id: :uuid do |t|
      t.string :name, null: false
      t.references :run, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
