# frozen_string_literal: true

class CreateKeyword < ActiveRecord::Migration[6.0]
  def change
    create_table :keywords do |t|
      t.belongs_to :recipe
      t.belongs_to :tag

      t.timestamps
    end
  end
end
