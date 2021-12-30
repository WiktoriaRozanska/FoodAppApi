# frozen_string_literal: true

class ChangeReferenceInRecipeTagsToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipe_tags, :recipe_id
    add_reference :recipe_tags, :recipe, null: true, foreign_key: true, type: :uuid
  end
end
