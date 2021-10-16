# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes_in_days
#
#  id         :bigint           not null, primary key
#  day_id     :bigint
#  recipe_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RecipesInDay < ApplicationRecord
  belongs_to :day
  belongs_to :recipe
end
