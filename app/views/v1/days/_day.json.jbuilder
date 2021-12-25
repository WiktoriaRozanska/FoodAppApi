json.extract! day, :id, :name, :position

json.recipes do
  json.array! day.recipes_in_days do |recipes_in_day|
    json.partial! 'v1/recipes/recipe_min', recipe: recipes_in_day.recipe
  end
end