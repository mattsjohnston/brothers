class GroupGoalsService

  def initialize(group)
    @group = group
  end

  def update_tasks
    clear_tasks Time.now
    create_tasks Time.now
  end

  def reset_tasks
    clear_tasks
    create_tasks
  end

  def clear_tasks(after_date = nil)
    tasks = @group.goal_tasks
    tasks = tasks.where('due_date > ?', after_date) unless after_date.nil?
    tasks.destroy_all
  end

  def create_tasks(after_date = nil)
    @group.goals.each do |goal|
      create_tasks_for_goal goal, after_date
    end
  end

  def create_tasks_for_goal(goal, after_date = nil)
    # Create a time duration (i.e. 1.week or 2.days)
    interval = goal.interval.send(goal.interval_unit)
    date_step = 0.days

    begin
      task_date = goal.group.starts_at + date_step
      if after_date.nil? || task_date > after_date
        goal.goal_tasks.create due_date: task_date, group: goal.group
      end

      date_step += interval
    end while date_step <= goal.group.total_days.days

  end

end
