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
    (@date - @group.starts_at.to_date).floor.days
  end

  def total_points
    @total_points ||= Goal.where('id in (?)', tasks.map(&:goal_id)).sum(:points)
  end

  def complete_points(user)
    Goal.where('id in (?)', complete_tasks(user).map(&:goal_id)).sum(:points)
  end

  def complete_weekly_tasks(user)
    @group.goal_tasks.complete(user).within_week(@date)
  end

  def incomplete_weekly_tasks(user)
    @group.goal_tasks.incomplete(user).within_week(@date)
  end

  def complete_tasks(user)
    @group.goal_tasks.complete(user).on @date
  end

  def incomplete_tasks(user)
    @group.goal_tasks.incomplete(user).on @date
  end

  def complete_task_count(user)
    complete_tasks(user).count.count
  end

  def complete_ratio(user)
    complete_task_count(user).to_f / task_count
  end

  def complete_percentage(user)
    "#{complete_ratio(user) * 100}%"
  end

  def point_ratio(user)
    complete_points(user).to_f / total_points
  end

  def point_percentage(user)
    "#{point_ratio(user) * 100}%"
  end

end
