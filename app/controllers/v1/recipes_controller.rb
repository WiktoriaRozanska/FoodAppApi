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
    V1::RecipeService.call(User.first, title, description, cal_per_serv, yields, time, ingredients, steps, tags)
    # @recipe = Recipe.new(recipe_params.merge({user: current_user}))

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
    params.require(:recipe).permit(:title, :cal_per_serv, :yields, :time, :description, ingredients: [], steps:[], tags: [])
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
