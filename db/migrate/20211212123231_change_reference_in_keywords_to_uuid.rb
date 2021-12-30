# frozen_string_literal: true

class ChangeReferenceInKeywordsToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column :keywords, :recipe_id
    add_reference :keywords, :recipe, null: true, foreign_key: true, type: :uuid
  end
end
