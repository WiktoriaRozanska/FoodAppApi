# frozen_string_literal: true

class ChangeReferenceInRecipeInDayToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes_in_days, :recipe_id
    add_reference :recipes_in_days, :recipe, null: true, foreign_key: true, type: :uuid
  end
end
