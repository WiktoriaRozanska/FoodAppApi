# frozen_string_literal: true

class CreateWeekPlan < ActiveRecord::Migration[6.0]
  def change
    create_table :week_plans do |t|
      t.belongs_to :user

      t.timestamps
    end
  end
end
