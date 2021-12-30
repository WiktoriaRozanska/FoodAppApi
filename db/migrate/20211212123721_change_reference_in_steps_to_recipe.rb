# frozen_string_literal: true

class ChangeReferenceInStepsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :steps, :recipe, null: true, foreign_key: true, type: :uuid
  end
end
