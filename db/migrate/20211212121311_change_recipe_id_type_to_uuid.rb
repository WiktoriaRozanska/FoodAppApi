# frozen_string_literal: true

class ChangeRecipeIdTypeToUuid < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :uuid, :uuid, default: 'gen_random_uuid()', null: false

    change_table :recipes do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute 'ALTER TABLE recipes ADD PRIMARY KEY (id);'
  end
end
