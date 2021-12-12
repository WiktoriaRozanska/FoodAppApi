# frozen_string_literal: true

class V1::RecipesController < V1Controller
  before_action :set_recipe, only: %i[show update destroy]

  def index
    @recipes = Recipe.all

    render json: @recipes
  end

  def show
    render json: @recipe
  end

  def create
    byebug
    @recipe = Recipe.new(recipe_params.merge({user: current_user}))

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :cal_per_serv, :yields, :total_time, :comment, ingredients: [], steps:[])
  end
end
