# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  # # VALIDATION
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  # validates :password, confirmation: { case_sensitive: true }
  # validates :password, length: { minimum: 8 }

  # RELATIONSHIP
  has_many :recipes, inverse_of: :user
  has_many :favorites, inverse_of: :user
  has_many :shop_lists, inverse_of: :user
  has_many :week_plans, inverse_of: :user
  has_many :days, through: :week_plans
end
