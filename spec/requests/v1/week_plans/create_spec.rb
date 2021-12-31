# frozen_string_literal: true

require 'rails_helper'
require 'headers_helper'

RSpec.describe 'POST /v1/week_plans', type: :request do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }

  context 'when auth' do
    context 'is invalid' do
      let(:request) { post v1_week_plans_path }

      before { request }

      it { expect(response).to have_http_status(:unauthorized) }
    end

    context 'is valid' do
      let(:params) do
        {
          week_plan: {
            recipe_id: recipe.id,
            days: %w[Mon Tue Wed]
          }
        }
        end
      let(:request) { post v1_week_plans_path, headers: authenticated_header(user), params: params }

      before { request }

      it 'return correct status' do
        expect(response).to have_http_status(:ok)
        expect(user.reload.week_plan.days.first.recipes.first.id).to eq(recipe.id)
      end
    end
  end
end