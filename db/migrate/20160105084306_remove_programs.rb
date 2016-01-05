class RemovePrograms < ActiveRecord::Migration
  def change
    remove_column :goal_completions, :program_id, :integer
    add_column :goal_completions, :group_id, :integer
    
    drop_table :programs
  end
end
