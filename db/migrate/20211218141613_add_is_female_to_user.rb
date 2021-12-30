# frozen_string_literal: true

class AddIsFemaleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_female, :bool, default: true
  end
end
