# frozen_string_literal: true

# == Schema Information
#
# Table name: days
#
#  id          :bigint           not null, primary key
#  name        :string
#  position    :integer
#  week_day_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Day < ApplicationRecord
  belongs_to :week_plan
  has_many :recipes_in_days, inverse_of: :day, dependent: :destroy
  has_many :recipes, through: :recipes_in_days

  default_scope { order(position: :asc) }
end
