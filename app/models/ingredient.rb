# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_many :shop_lists, inverse_of: :ingredient
end
