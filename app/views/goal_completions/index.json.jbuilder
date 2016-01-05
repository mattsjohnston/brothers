json.array!(@goal_completions) do |goal_completion|
  json.extract! goal_completion, :id, :goal_id, :user_id, :program_id
  json.url goal_completion_url(goal_completion, format: :json)
end
