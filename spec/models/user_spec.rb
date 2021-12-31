# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'assocations' do
    it { should have_many(:recipes).dependent(:nullify) }
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:shop_lists).dependent(:destroy) }
    it { should have_one(:week_plan).dependent(:destroy) }
  end
end
