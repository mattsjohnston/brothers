class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :goals
  has_many :goal_completions

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
