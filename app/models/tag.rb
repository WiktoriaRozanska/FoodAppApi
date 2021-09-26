# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :keywords, inverse_of: :tag
  has_many :recipes, through: :keywords
end
