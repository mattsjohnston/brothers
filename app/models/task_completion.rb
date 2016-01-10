# == Schema Information
#
# Table name: task_completions
#
#  id           :integer          not null, primary key
#  goal_task_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  group_id     :integer
#

class TaskCompletion < ActiveRecord::Base
  belongs_to :goal_task
  belongs_to :user
  belongs_to :group
end
