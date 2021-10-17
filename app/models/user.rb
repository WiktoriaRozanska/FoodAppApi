# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  username               :string
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
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
         jwt_revocation_strategy: JwtDenylist

  # VALIDATION
  validates :first_name, :last_name, :username, presence: true
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
