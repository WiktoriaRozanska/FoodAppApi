# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Day, type: :model do
  context 'assocations' do
    it { should belong_to(:week_plan) }
    it { should have_many(:recipes_in_days).dependent(:destroy) }
  end
end