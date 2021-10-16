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
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
