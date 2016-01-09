class TaskService
  
  def initialize(task)
    @task = task
  end

  def toggle(user)
    if @task.complete? user
      undo user
    else
      complete user
    end
  end

  def complete(user)
    @task.task_completions.create user: user
  end

  def undo(user)
    @task.task_completions.find_by_user_id(user.id).destroy
  end

end
