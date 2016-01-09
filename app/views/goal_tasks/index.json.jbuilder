json.array!(@goal_tasks) do |goal_task|
  json.extract! goal_task, :id, :goal_id, :group_id
  json.url goal_task_url(goal_task, format: :json)
end
