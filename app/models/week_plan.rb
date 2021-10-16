# frozen_string_literal: true

# == Schema Information
#
# Table name: week_plans
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WeekPlan < ApplicationRecord
  belongs_to :user
  has_many :days, inverse_of: :week_plan
end
