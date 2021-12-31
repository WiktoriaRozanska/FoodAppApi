# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesInDay, type: :model do
  context 'assocations' do
    it { should belong_to(:day) }
    it { should belong_to(:recipe) }
  end
end
