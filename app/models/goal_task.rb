# == Schema Information
#
# Table name: goal_tasks
#
#  id         :integer          not null, primary key
#  goal_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  due_date   :datetime
#

class GoalTask < ActiveRecord::Base
  belongs_to :goal
  belongs_to :group
  has_many :task_completions

  delegate :name, to: :goal
  delegate :interval, to: :goal

  scope :on, lambda { |date|
    where(due_date: date)
  }

  def complete?(user)
    user.task_completions.where(goal_task: self).count >= self.interval
  end

end
