# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Keyword, type: :model do
  context 'assocations' do
    it { should belong_to(:tag) }
    it { should belong_to(:recipe) }
  end
end