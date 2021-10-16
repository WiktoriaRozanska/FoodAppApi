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
end
