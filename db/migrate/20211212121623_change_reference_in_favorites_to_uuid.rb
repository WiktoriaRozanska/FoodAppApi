class ChangeReferenceInFavoritesToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column  :favorites, :user_id
    remove_column  :favorites, :recipe_id
    add_reference :favorites, :users, null: true, foreign_key: true, type: :uuid
    add_reference :favorites, :recipe, null: true, foreign_key: true, type: :uuid
  end
end
