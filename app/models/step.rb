# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id          :bigint           not null, primary key
#  description :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Step < ApplicationRecord
  belongs_to :recipe

  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
