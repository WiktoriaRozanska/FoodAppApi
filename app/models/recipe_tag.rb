# frozen_string_literal: true

# == Schema Information
#
# Table name: recipe_tags
#
#  id         :bigint           not null, primary key
#  tag_id     :bigint
#  recipe_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RecipeTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag
end
