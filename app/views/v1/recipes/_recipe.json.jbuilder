# frozen_string_literal: true

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

json.owner recipe.user_id.eql?(current_user.id)

json.favorite current_user.favorites.find_by(recipe_id: recipe.id).present?

json.image_url recipe.image.attached? ? url_for(recipe.image) : nil
