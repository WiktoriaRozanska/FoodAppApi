# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context 'assocations' do
    it { should belong_to(:recipe) }
    it { should have_many(:shop_lists).dependent(:destroy) }
  end
end