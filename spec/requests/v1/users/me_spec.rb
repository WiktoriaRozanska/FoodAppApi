# frozen_string_literal: true

require 'rails_helper'
require 'headers_helper'

RSpec.describe 'GET /v1/me', type: :request do
  let!(:user) { create(:user) }

  context 'when auth' do
    context 'is invalid' do
      let(:request) { get v1_get_user_details_path }

      before { request }

      it { expect(response).to have_http_status(:unauthorized) }
    end
    
    context 'is valid' do
      let(:request) { get v1_get_user_details_path, headers: authenticated_header(user) }

      before { request }

      it 'return correct status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
