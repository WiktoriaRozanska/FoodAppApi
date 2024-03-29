# frozen_string_literal: true

class AddUserToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :user, index: true
  end
end
