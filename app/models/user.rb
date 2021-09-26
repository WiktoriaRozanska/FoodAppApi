# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # VALIDATION
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates :password, length: { minimum: 8 }

  # RELATIONSHIP
  has_many :recipes, inverse_of: :user
  has_many :favorites, inverse_of: :user
  has_many :shop_lists, inverse_of: :user
  has_many :week_plans, inverse_of: :user
  has_many :days, through: :week_plans
end
