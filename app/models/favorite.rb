# frozen_string_literal: true

# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  recipe_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  scope :indexing, ->(ids) { where(id: ids) }
end
