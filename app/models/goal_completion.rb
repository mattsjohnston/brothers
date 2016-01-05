# == Schema Information
#
# Table name: goal_completions
#
#  id         :integer          not null, primary key
#  goal_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  group_id   :integer
#

class GoalCompletion < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  belongs_to :group
end
