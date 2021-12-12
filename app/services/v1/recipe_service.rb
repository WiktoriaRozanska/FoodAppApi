class V1::RecipeService
  def self.call(user, title, description, cal_per_serv, yields, time, ingredients, steps, tags)
    new(user, title, description, cal_per_serv, yields, time, ingredients, steps, tags).call
  end

  def initialize(user, title, description, cal_per_serv, yields, time, ingredients, steps, tags)
    @user = user
    @title = title
    @description = description
    @cal_per_serv = cal_per_serv
    @yields = yields
    @time = time
    @ingredients = ingredients
    @steps = steps
    @tags = tags
  end

  def call
    ActiveRecord::Base.transaction do
      @recipe = Recipe.create!(user: user, title: title, cal_per_serv: cal_per_serv, time: time, yields: yields, description: description)

      V1::Recipes::StepsService.call(recipe, steps)
      V1::Recipes::TagsService.call(recipe, tags)
      V1::Recipes::IngredientsService.call(recipe, ingredients)
    end

    recipe.reload
  end

  private
  attr_reader :user, :title, :description, :cal_per_serv, :yields, :time, :ingredients, :steps, :tags
  attr_accessor :recipe
end