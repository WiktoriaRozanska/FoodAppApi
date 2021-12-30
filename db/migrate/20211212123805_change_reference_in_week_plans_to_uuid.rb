# frozen_string_literal: true

class ChangeReferenceInWeekPlansToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column :week_plans, :user_id
    add_reference :week_plans, :user, null: true, foreign_key: true, type: :uuid
  end
end
