class CreateMeches < ActiveRecord::Migration[7.1]
  def change
    create_table :meches do |t|

      t.timestamps
    end
  end
end
