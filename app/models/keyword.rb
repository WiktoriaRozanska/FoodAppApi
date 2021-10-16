# frozen_string_literal: true

# == Schema Information
#
# Table name: keywords
#
#  id         :bigint           not null, primary key
#  recipe_id  :bigint
#  tag_id     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Keyword < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag
end
