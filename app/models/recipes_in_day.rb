# frozen_string_literal: true

class RecipesInDay < ApplicationRecord
  belongs_to :day
  belongs_to :recipe
end
