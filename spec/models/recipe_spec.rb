# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'assocations' do
    it { should belong_to(:user) }
    it { should have_many(:ingredients).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:recipes_in_days).dependent(:destroy) }
    it { should have_many(:steps).dependent(:destroy) }
    it { should have_many(:keywords).dependent(:destroy) }
  end
end