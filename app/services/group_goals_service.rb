class GroupGoalsService

  def initialize(group)
    @group = group
  end

  def update_tasks
    cleanup_tasks
    create_tasks
  end

  def cleanup_tasks
    @group.goal_tasks.where('due_date > ?', Time.now).delete_all
  end

  def create_tasks
    @group.goals.each do |goal|
      create_tasks_for_goal goal
    end
  end

  def create_tasks_for_goal(goal)
    # Create a time duration (i.e. 1.week or 2.days)
    interval = goal.interval.send(goal.interval_unit)
    task_date = goal.group.starts_at

    begin
      goal.goal_tasks.create due_date: task_date, group: goal.group

      task_date += interval
    end while task_date <= goal.group.ends_at

  end

end
