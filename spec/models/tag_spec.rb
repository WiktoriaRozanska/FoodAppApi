# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'assocations' do
    it { should have_many(:keywords).dependent(:destroy) }
  end
end
