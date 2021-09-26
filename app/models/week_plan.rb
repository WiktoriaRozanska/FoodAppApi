# frozen_string_literal: true

class WeekPlan < ApplicationRecord
  belongs_to :user
  has_many :days, inverse_of: :week_plan
end
