json.array!(@task_completions) do |task_completion|
  json.extract! task_completion, :id
  json.url task_completion_url(task_completion, format: :json)
end
