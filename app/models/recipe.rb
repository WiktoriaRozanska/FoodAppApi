# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  title        :string
#  cal_per_serv :integer
#  yields       :integer
#  total_time   :integer
#  comment      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, inverse_of: :recipe
  has_many :favorites, inverse_of: :recipe
  has_many :recipes_in_days, inverse_of: :recipe
  has_many :steps, inverse_of: :recipe
  has_many :keywords, inverse_of: :recipe
  has_many :tags, through: :keywords
end
