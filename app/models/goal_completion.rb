class GoalCompletion < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  belongs_to :program
end
