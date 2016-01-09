class CreateGoalTasks < ActiveRecord::Migration
  def change
    create_table :goal_tasks do |t|
      t.references :goal, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
