# frozen_string_literal: true

class CreateDay < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :name
      t.integer :position
      t.belongs_to :week_day

      t.timestamps
    end
  end
end
