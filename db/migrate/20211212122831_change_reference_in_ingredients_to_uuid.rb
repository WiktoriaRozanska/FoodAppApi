class ChangeReferenceInIngredientsToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column  :ingredients, :recipe_id
    add_reference :ingredients, :recipe, null: true, foreign_key: true, type: :uuid
  end
end
