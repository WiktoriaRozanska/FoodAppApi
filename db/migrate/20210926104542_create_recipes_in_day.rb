# frozen_string_literal: true

class CreateRecipesInDay < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes_in_days do |t|
      t.belongs_to :day
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
