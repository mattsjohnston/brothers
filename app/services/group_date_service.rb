class GroupDateService

  def initialize(group, date)
    @group = group
    @date = date
  end

  def task_count
    @task_count ||= tasks.count
  end

  def tasks
    @tasks ||= @group.goal_tasks.on(@date)
  end

  def days_since_beginning
    (@date - @group.starts_at.to_date).to_i + 1
  end

  def total_points
    @total_points ||= Goal.where('id in (?)', tasks.map(&:goal_id)).sum(:points)
  end

  def total_points_week
    @total_points_week ||= Goal.joins("LEFT JOIN goal_tasks ON goal_tasks.goal_id = goals.id").where('goal_tasks.id in (?)', @group.goal_tasks.within_week(@date).map(&:id)).group('goals.id').sum('goals.points').values.sum
  end

  def complete_points(user)
    Goal.where('id in (?)', complete_tasks(user).map(&:goal_id)).sum(:points)
  end

  def complete_points_week(user)
    Goal.where('id in (?)', complete_tasks_in_week(user).map(&:goal_id)).sum(:points)
  end

  def complete_weekly_tasks(user)
    @group.goal_tasks.complete(user).within_week(@date).weekly
  end

  def complete_tasks_in_week(user)
    @group.goal_tasks.complete(user).within_week(@date)
  end

  def incomplete_weekly_tasks(user)
    @group.goal_tasks.incomplete(user).within_week(@date).weekly
  end

  def complete_tasks(user)
    @group.goal_tasks.complete(user).on @date
  end

  def incomplete_tasks(user)
    @group.goal_tasks.incomplete(user).on @date
  end

  def point_ratio(user)
    complete_points(user).to_f / total_points
  end

  def point_ratio_week(user)
    complete_points_week(user).to_f / total_points_week
  end

  def point_percentage(user)
    "#{point_ratio(user) * 100}%"
  end

  def point_percentage_week(user)
    "#{point_ratio_week(user) * 100}%"
  end

end
