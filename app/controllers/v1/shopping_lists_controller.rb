class V1::ShoppingListsController < V1Controller
  def show
    ingredient_list = V1::ShoppingListService.call(week_plan_id)

    render json: { shopping_list: ingredient_list }, status: :ok
  end

  private

  def week_plan_id
    current_user.week_plan&.id
  end
end
