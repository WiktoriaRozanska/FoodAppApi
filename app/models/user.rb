# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  # VALIDATION
  validates :username, presence: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  # validates :password, confirmation: { case_sensitive: true }
  # validates :password, length: { minimum: 8 }

  # RELATIONSHIP
  has_many :recipes, inverse_of: :user
  has_many :favorites, inverse_of: :user
  has_many :shop_lists, inverse_of: :user
  has_one :week_plan, inverse_of: :user
  has_many :days, through: :week_plans

  enum day: { mon: 'Mon', tue: 'Tue', wed: 'Wed', thu: 'Thu', fri: 'Fri', sat: 'Sat', sun: 'Sun' }

  after_create_commit :create_week_plan

  private

  def create_week_plan
    WeekPlan.create(user_id: self.id)

    %w[Mon Tue Wed Thu Fri Sat Sun].each_with_index do |day, index|
      # self.week_plan.days << Day.new(name: day, position: index)
      Day.create(name: day, position: index, week_plan_id: self.week_plan.id)
    end
  end
end
