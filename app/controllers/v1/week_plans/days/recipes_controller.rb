# frozen_string_literal: true

class V1::WeekPlans::Days::RecipesController < V1Controller
  def destroy
    load_recipe.destroy

    head :ok
  end

  private

  def day_id
    params[:day_id]
  end

  def recipe_id
    params[:id]
  end

  def load_recipe
    current_user.week_plan.days.find(day_id)&.recipes_in_days.find_by(recipe_id: recipe_id)
  end
end