class ChangeStartedAtToStartsAt < ActiveRecord::Migration
  def change
    rename_column :groups, :started_at, :starts_at
  end
end
