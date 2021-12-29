# frozen_string_literal: true

class V1::Recipes::ImagesController < V1Controller
  def create
    @recipe = recipe_load
    @recipe.update!(image: image_params)
    @recipe = @recipe.reload
  end

  private

  def recipe_load
    Recipe.find(params[:recipe_id])
  end

  def image_params
    params[:image]
  end

end
