# frozen_string_literal: true

require 'rails_helper'
require 'headers_helper'

RSpec.describe 'GET /v1/week_plans', type: :request do
  let!(:user) { create(:user) }

  context 'when auth' do
    context 'is invalid' do
      let(:request) { get v1_week_plans_path }

      before { request }

      it { expect(response).to have_http_status(:unauthorized) }
    end

    context 'is valid' do
      let(:request) { get v1_week_plans_path, headers: authenticated_header(user) }

      before { request }

      it 'return correct status' do
        expect(response).to have_http_status(:ok)
        parse_response = JSON.parse response.body
        expect(parse_response['days'].count).to eq(7)
        expect(parse_response['days'].pluck('name')).to eq(%w[Mon Tue Wed Thu Fri Sat Sun])
      end
    end
  end
end