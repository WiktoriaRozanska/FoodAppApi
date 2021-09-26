# frozen_string_literal: true

class CreateRecipeTag < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_tags do |t|
      t.belongs_to :tag
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
