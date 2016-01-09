class AddStateAndStartedAtToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :aasm_state, :string
    add_column :groups, :started_at, :datetime
  end
end
