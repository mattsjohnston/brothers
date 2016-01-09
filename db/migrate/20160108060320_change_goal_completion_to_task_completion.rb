class ChangeGoalCompletionToTaskCompletion < ActiveRecord::Migration
  def change
    rename_table :goal_completions, :task_completions
    rename_column :task_completions, :goal_id, :goal_task_id
  end
end
