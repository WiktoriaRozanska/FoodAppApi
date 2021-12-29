# frozen_string_literal: true

class V1::UsersController < V1Controller
  def me
    @user = current_user
  end

  def update
    byebug
    load_user.update!(permitted_params)

    @user = current_user.reload
  end

  private

  def user_id
    params[:id]
  end

  def load_user
    @user = User.find(user_id)
  end

  def permitted_params
    params.require(:user).permit(:is_female, :username)
  end
end
