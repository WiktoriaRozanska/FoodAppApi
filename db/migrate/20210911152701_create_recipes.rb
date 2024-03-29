# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cal_per_serv
      t.integer :yields
      t.integer :time
      t.string :description

      t.timestamps
    end
  end
end
