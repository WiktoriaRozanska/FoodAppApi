# frozen_string_literal: true

class CreateStep < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :description
      t.integer :position

      t.timestamps
    end
  end
end
