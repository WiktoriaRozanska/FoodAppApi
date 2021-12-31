# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShopList, type: :model do
  context 'assocations' do
    it { should belong_to(:user) }
    it { should belong_to(:ingredient) }
  end
end
