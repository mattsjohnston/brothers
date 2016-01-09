class AddDueDateToGoalTask < ActiveRecord::Migration
  def change
    add_column :goal_tasks, :due_date, :datetime
  end
end
