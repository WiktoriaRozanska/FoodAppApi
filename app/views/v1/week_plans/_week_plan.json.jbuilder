json.extract! week_plan, :id

json.days do
  json.array! week_plan.days do |day|
    json.partial! 'v1/days/day', day: day
  end
end