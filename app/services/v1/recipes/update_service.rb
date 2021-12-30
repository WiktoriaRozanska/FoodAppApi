# frozen_string_literal: true

class V1::Recipes::UpdateService
  # rubocop:disable Metrics/ParameterLists
  def self.call(recipe_id, title, description, cal_per_serv, yields, time, ingredients, steps, tags)
    new(recipe_id, title, description, cal_per_serv, yields, time, ingredients, steps, tags).call
  end

  def initialize(recipe_id, title, description, cal_per_serv, yields, time, ingredients, steps, tags)
    @recipe_id = recipe_id
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
      @recipe = Recipe.find(recipe_id)

      @recipe.update!(title: title, description: description, cal_per_serv: cal_per_serv, yields: yields,
                      time: time)
      @recipe.steps.destroy_all
      @recipe.ingredients.destroy_all
      @recipe.keywords.destroy_all

      V1::Recipes::StepsService.call(recipe, steps)
      V1::Recipes::TagsService.call(recipe, tags)
      V1::Recipes::IngredientsService.call(recipe, ingredients)
    end

    @recipe.reload
  end

  private

  attr_reader :title, :description, :cal_per_serv, :yields, :time, :ingredients, :steps, :recipe_id, :tags
  attr_accessor :recipe
  # rubocop:enable Metrics/ParameterLists
end
