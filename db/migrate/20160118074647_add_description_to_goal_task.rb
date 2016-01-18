class AddDescriptionToGoalTask < ActiveRecord::Migration
  def change
    add_column :goal_tasks, :description, :string
  end
end
