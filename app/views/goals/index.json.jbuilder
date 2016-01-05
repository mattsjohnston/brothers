json.array!(@goals) do |goal|
  json.extract! goal, :id, :name, :description, :repeats, :interval, :interval_unit
  json.url goal_url(goal, format: :json)
end
