class ChangeEndsAtToTotalDays < ActiveRecord::Migration
  def change
    remove_column :groups, :ends_at
    add_column :groups, :total_days, :integer
  end
end
