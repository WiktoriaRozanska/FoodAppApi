json.extract! recipe, :id, :title, :cal_per_serv, :yields, :time, :description

json.steps do
  json.array! recipe.steps, partial: 'v1/steps/step', as: :step
end

json.ingredients do
  json.array! recipe.ingredients, partial: 'v1/ingredients/ingredient', as: :ingredient
end

json.tags do
  json.array! recipe.tags, partial: 'v1/tags/tag', as: :tag
end