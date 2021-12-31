# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Step, type: :model do
  context 'assocations' do
    it { should belong_to(:recipe) }
  end
end
