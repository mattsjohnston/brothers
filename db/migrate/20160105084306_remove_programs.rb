class RemovePrograms < ActiveRecord::Migration
  def change
    remove_column :task_completions, :program_id, :integer
    add_column :task_completions, :group_id, :integer
    
    drop_table :programs
  end
end
