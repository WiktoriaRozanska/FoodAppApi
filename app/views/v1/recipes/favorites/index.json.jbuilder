# # frozen_string_literal: true
#
# json.array! @favorites, partial: 'v1/recipes/recipe', as: :recipe

# frozen_string_literal: true

json.array! @favorites do |favorite|
  json.partial! 'v1/recipes/recipe', recipe: favorite.recipe
end
