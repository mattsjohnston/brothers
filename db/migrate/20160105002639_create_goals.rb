class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.boolean :repeats
      t.integer :interval
      t.string :interval_unit

      t.timestamps
    end
  end
end
