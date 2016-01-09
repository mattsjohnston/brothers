# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)
#  starts_at  :datetime
#  ends_at    :datetime
#

class Group < ActiveRecord::Base
  include AASM

  has_and_belongs_to_many :users
  has_many :goals
  has_many :task_completions
  has_many :goal_tasks

  aasm do
    state :paused, :initial => true
    state :active

    event :start, after: :create_group_tasks do
      transitions from: :paused, to: :active
    end

    event :pause do
      transitions from: :active, to: :paused
    end
  end

  def create_group_tasks
    group_goals_service = GroupGoalsService.new self
    group_goals_service.update_tasks
  end

  def add_user(user)
    self.users << user
  end

  def remove_user(user)
    self.users.delete(user)
  end

  def has_member?(user)
    self.users.where(:id => user.id).present?
  end

end
