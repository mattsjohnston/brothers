class CreateTaskCompletions < ActiveRecord::Migration
  def change
    create_table :task_completions do |t|
      t.references :goal_task, index: true
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
