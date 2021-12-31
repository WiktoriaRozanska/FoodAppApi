# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeekPlan, type: :model do
  context 'assocations' do
    it { should belong_to(:user) }
    it { should have_many(:days) }
  end
end
