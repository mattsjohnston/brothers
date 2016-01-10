class GroupDateService

  def initialize(group, date)
    @group = group
    @date = date
  end

  def task_count
    @task_count ||= tasks.count
  end

  def tasks
    @tasks ||= get_tasks
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

  def complete_percent(user)
    "#{complete_ratio(user) * 100}%"
  end


  private

    def get_tasks
      @group.goal_tasks.on(@date)
    end

end
