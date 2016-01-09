# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  repeats       :boolean
#  interval      :integer
#  interval_unit :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  group_id      :integer
#

class Goal < ActiveRecord::Base
  belongs_to :group
  has_many :goal_completions
  has_many :goal_tasks

  def complete(user)
    GoalCompletion.create(
      goal: self,
      user: user,
      group: group
    )
  end

end
