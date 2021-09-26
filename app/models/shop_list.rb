# frozen_string_literal: true

class ShopList < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
end
