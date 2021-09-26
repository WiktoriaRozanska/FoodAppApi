# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, inverse_of: :recipe
  has_many :favorites, inverse_of: :recipe
  has_many :recipes_in_days, inverse_of: :recipe
  has_many :steps, inverse_of: :recipe
  has_many :keywords, inverse_of: :recipe
  has_many :tags, through: :keywords
end
