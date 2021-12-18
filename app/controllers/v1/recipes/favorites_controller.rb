# frozen_string_literal: true

class V1::Recipes::FavoritesController < V1Controller
  def index
    @favorites = current_user.favorites
    @favorites = V1::Pagination.call(@favorites, start_index, size) if @favorites.present?
  end

  def create
    current_user.favorites << Favorite.new(recipe_id: recipe_id)

    head :ok
  end

  def destroy
    # ToDo: only owner can delete recipe
    Favorite.find(id).destroy

    head :ok
  end

  private

  def id
    params[:id]
  end

  def recipe_id
    params[:recipe_id]
  end

  def start_index
    params[:startIndex].to_i
  end

  def size
    params[:size].to_i
  end
end
