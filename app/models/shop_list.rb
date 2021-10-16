# frozen_string_literal: true

# == Schema Information
#
# Table name: shop_lists
#
#  id            :bigint           not null, primary key
#  user_id       :bigint
#  ingredient_id :bigint
#  bought        :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class ShopList < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
end
