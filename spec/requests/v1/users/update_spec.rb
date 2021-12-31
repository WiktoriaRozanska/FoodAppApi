# frozen_string_literal: true

require 'rails_helper'
require 'headers_helper'

RSpec.describe 'GET /v1/users/:id', type: :request do
  let!(:user) { create(:user) }

  let(:params) do
    {
      user: {
        username: 'John'
      }
    }
  end

  context 'when auth' do
    context 'is invalid' do
      let(:request) { patch v1_user_path(id: user.id), params: params }

      before { request }

      it { expect(response).to have_http_status(:unauthorized) }
    end

    context 'is valid' do
      let(:request) { patch v1_user_path(id: user.id), headers: authenticated_header(user), params: params }

      before { request }

      it 'return correct status' do
        expect(response).to have_http_status(:ok)
        expect(user.reload.username).to eq('John')
      end
    end
  end
end