class GroupGoalsService

  def initialize(group, date)
    @group = group
    @date = date

    @goals = get_goals_by_date(@date)
  end

  def user_goals(user)
    user_goals = @goals.map do |goal|
      user_goal = UserGoal.new(goal, @user, @date)
    end
    user_goals
  end

  def get_goals_by_date(date)
    allGoals = @group.goals
  end

  def update_goals
  end

  def user_completed_goals(user)
    @user_completed_goals = get_user_completed_goals(user)
  end

  def get_user_completed_goals(user)
    return @group.goal_completions.where(user: user)
  end

end
