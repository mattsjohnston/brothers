# == Schema Information
#
# Table name: goal_tasks
#
#  id          :integer          not null, primary key
#  goal_id     :integer
#  group_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  due_date    :datetime
#  description :string(255)
#

class GoalTask < ActiveRecord::Base
  belongs_to :goal
  belongs_to :group
  has_many :task_completions, dependent: :destroy

  delegate :name, to: :goal
  delegate :interval, to: :goal
  delegate :points, to: :goal

  scope :on, lambda { |date|
    where('goal_tasks.due_date = ?', date)
  }
  scope :complete, lambda { |user|
    joins(:task_completions).
    group('goal_tasks.id').
    where('task_completions.user_id = ?', user.id).
    having('COUNT(task_completions.id) >= 1')
  }
  scope :incomplete, lambda { |user|
    where("not exists (select null from task_completions where task_completions.goal_task_id = goal_tasks.id and task_completions.user_id = ?)", user.id)
  }

  def complete?(user)
    user.task_completions.where(goal_task: self).count >= self.interval
  end

  def current_description
    self.description ? self.description : self.goal.description
  end

end
