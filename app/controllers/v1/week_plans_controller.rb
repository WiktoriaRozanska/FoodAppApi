# frozen_string_literal: true

class V1::WeekPlansController < V1Controller
  def create
    V1::WeekPlanService.call(recipe_id, days, current_user)

    head :ok
  end

  def destroy

  end

  def index

  end

  private

  def week_plan_params
    params.require(:week_plan).permit(:recipe_id, days: [])
  end

  def recipe_id
    week_plan_params[:recipe_id]
  end

  def days
    week_plan_params[:days]
  end
end