class UserGoal
  include ActiveModel::Model

  attr_accessor :total_in_interval,
                :complete_in_interval,
                :group,
                :user,
                :goal

  delegate :name, to: :goal
  delegate :description, to: :goal
  delegate :repeats, to: :goal
  delegate :interval, to: :goal
  delegate :interval_unit, to: :goal

  def initialize(goal, user, date)
    # @name = goal.name
    @goal = goal
    @date = date
    @total_in_interval = 0
    @complete_in_interval = 0
    @group = goal.group
    @user = user
  end

  def complete?
    @complete ||= get_completion()
  end

  def get_completion
    @goal.goal_completions.where(created_at: self.date_range).count >= self.interval
  end

  def date_range
    case self.interval_unit
      when 'day'
        @date.beginning_of_day..@date.end_of_day
      when 'week'
        @date.at_beginning_of_week..@date.at_end_of_week
      when 'month'
        @date.at_beginning_of_month..@date.at_end_of_month
    end
  end

end