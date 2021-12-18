# frozen_string_literal: true

class V1::RecipesController < V1Controller
  before_action :set_recipe, only: %i[show update destroy]

  def index
    @recipes = Recipe.detailed_search(filters_parameters)
    @recipes = V1::Pagination.call(@recipes, start_index, size)
  end

  def show
  end

  def create
    @recipe = V1::RecipeService.call(current_user, title, description, cal_per_serv, yields, time, ingredients, steps, tags)
  end

  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # ToDo: only owner can delete recipe
    @recipe.destroy
  end

  def my_recipes
    @recipes = current_user.recipes
    @recipes = V1::Pagination.call(@recipes, start_index, size) if @recipes.present?
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :cal_per_serv, :yields, :time, :description, ingredients: [], steps:[], tags: [])
  end

  def filters_parameters
    params[:filters]&.map(&:to_i)
  end

  def start_index
    params[:startIndex].to_i
  end

  def size
    params[:size].to_i
  end

  def title
    recipe_params[:title]
  end

  def description
    recipe_params[:description]
  end

  def cal_per_serv
    recipe_params[:cal_per_serv]
  end

  def yields
    recipe_params[:yields]
  end

  def time
    recipe_params[:time]
  end

  def ingredients
    params[:recipe][:ingredients]
  end

  def steps
    recipe_params[:steps]
  end

  def tags
    recipe_params[:tags]
  end
end
