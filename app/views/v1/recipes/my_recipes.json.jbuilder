# frozen_string_literal: true

json.array! @recipes, partial: 'v1/recipes/recipe', as: :recipe
