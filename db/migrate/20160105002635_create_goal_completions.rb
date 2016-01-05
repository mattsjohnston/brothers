class CreateGoalCompletions < ActiveRecord::Migration
  def change
    create_table :goal_completions do |t|
      t.references :goal, index: true
      t.references :user, index: true
      t.references :program, index: true

      t.timestamps
    end
  end
end
