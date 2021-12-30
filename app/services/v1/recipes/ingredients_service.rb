# frozen_string_literal: true

class V1::Recipes::IngredientsService
  def self.call(recipe, ingredients)
    new(recipe, ingredients).call
  end

  def initialize(recipe, ingredients)
    @recipe = recipe
    @ingredients = ingredients
  end

  def call
    ingredients.each do |ingredient|
      recipe.ingredients << Ingredient.new(name: ingredient['name'], quantity: ingredient['quantity'],
                                           unit: ingredient['unit'])
    end
  end

  private

  attr_reader :ingredients, :recipe
end
