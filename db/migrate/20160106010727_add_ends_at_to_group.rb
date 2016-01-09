class AddEndsAtToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :ends_at, :datetime
  end
end
