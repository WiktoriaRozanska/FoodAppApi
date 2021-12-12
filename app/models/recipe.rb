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
  # relationship
  belongs_to :user
  has_many :ingredients, inverse_of: :recipe
  has_many :favorites, inverse_of: :recipe
  has_many :recipes_in_days, inverse_of: :recipe
  has_many :steps, inverse_of: :recipe
  has_many :keywords, inverse_of: :recipe
  has_many :tags, through: :keywords

  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cal_per_serv, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :yields, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
