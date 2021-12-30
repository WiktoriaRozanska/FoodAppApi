# frozen_string_literal: true

json.extract! recipe, :id, :title

json.image_url recipe.image.attached? ? url_for(recipe.image) : nil
