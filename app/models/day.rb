# frozen_string_literal: true

class Day < ApplicationRecord
  belongs_to :week_plan
  has_many :recipes_in_days, inverse_of: :day
  has_many :recipes, through: :recipes_in_days
end
