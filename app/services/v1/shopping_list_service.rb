# frozen_string_literal: true

class V1::ShoppingListService
  def self.call(week_plan_id)
    new(week_plan_id).call
  end

  def initialize(week_plan_id)
    @week_plan_id = week_plan_id
  end

  def call
    raise ActiveRecord::RecordNotFound, 'User didn\'t have a week plan' if week_plan_id.blank?

    generate_shopping_list
  end

  private

  attr_reader :week_plan_id

  def generate_shopping_list
    week_plan = WeekPlan.find(@week_plan_id)
    # rubocop:disable Lint/ShadowingOuterLocalVariable
    shopping_hash = Hash.new do |hash, ingredient_name|
      hash[ingredient_name] = Hash.new do |hash, unit|
        hash[unit] = 0
      end
    end
    # rubocop:enable Lint/ShadowingOuterLocalVariable
    week_plan.days.each do |day|
      generate_list_for_day(shopping_hash, day)
    end

    hash_to_list(shopping_hash)
  end

  def generate_list_for_day(shopping_list, day)
    day.recipes.each do |recipe|
      add_ingredient_to_list_for_one_recipe(shopping_list, recipe)
    end
  end

  def add_ingredient_to_list_for_one_recipe(shopping_list, recipe)
    recipe.ingredients.each do |ingredient|
      shopping_list[ingredient.name][ingredient.unit] += ingredient.quantity
    end
  end

  def hash_to_list(shopping_hash)
    shopping_list = []

    shopping_hash.each do |ingredient_name, _hash|
      shopping_hash[ingredient_name].each do |unit, _hash|
        shopping_list.append({ name: ingredient_name, unit: unit, quantity: shopping_hash[ingredient_name][unit] })
      end
    end

    shopping_list
  end
end
