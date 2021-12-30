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
  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :favorites, inverse_of: :recipe, dependent: :destroy
  has_many :recipes_in_days, inverse_of: :recipe, dependent: :destroy
  has_many :steps, inverse_of: :recipe, dependent: :destroy
  has_many :keywords, inverse_of: :recipe, dependent: :destroy
  has_many :tags, through: :keywords
  has_one_attached :image

  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cal_per_serv, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :yields, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # scopes
  scope :indexing, ->(ids) { where(id: ids) }
  scope :limit_to_tags, ->(tag_ids) { joins(:keywords).where('keywords.id' => tag_ids) if tag_ids.present? }

  def self.detailed_search(tag_ids)
    scope = all
    scope.limit_to_tags(tag_ids)
  end
end
