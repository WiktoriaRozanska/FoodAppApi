# frozen_string_literal: true

class V1::WeekPlanService
  def self.call(recipe_id, days, user)
    new(recipe_id, days, user).call
  end

  def initialize(recipe_id, days, user)
    @recipe_id = recipe_id
    @days = days
    @user = user
  end

  def call
    week_plan = WeekPlan.find_or_create_by(user_id: user.id)
    recipe = Recipe.find(recipe_id)

    days.each do |selected_day|
      day = Day.find_or_create_by(name: selected_day, position: position(selected_day), week_plan_id: week_plan.id)
      RecipesInDay.find_or_create_by(day_id: day.id, recipe_id: recipe.id)
    end
  end

  attr_reader :recipe_id, :days, :user

  private

  ALL_DAYS = %w[Mon Tue Wed Thu Fri Sat Sun].freeze

  def position(day)
    ALL_DAYS.index(day)
  end
end
