# frozen_string_literal: true

class Keyword < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag
end
