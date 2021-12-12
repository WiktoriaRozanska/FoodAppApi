class ChangeReferenceInRecipeToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column  :recipes, :user_id
    add_reference :recipes, :user, null: true, foreign_key: true, type: :uuid
  end
end
