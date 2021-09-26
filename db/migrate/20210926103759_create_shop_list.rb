# frozen_string_literal: true

class CreateShopList < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_lists do |t|
      t.belongs_to :user
      t.belongs_to :ingredient
      t.boolean :bought, default: false

      t.timestamps
    end
  end
end
