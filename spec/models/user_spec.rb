require 'rails_helper'

RSpec.describe User, type: :model do
  context "assocations" do
    it { should have_many(:recipes) }
    it { should have_many(:favorites) }
    it { should have_many(:shop_lists) }
    it { should have_many(:week_plans) }
    it { should have_many(:days) }
  end
end
