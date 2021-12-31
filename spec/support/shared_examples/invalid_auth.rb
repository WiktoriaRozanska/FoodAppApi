# frozen_string_literal: true

RSpec.shared_examples 'unauthorized user' do
  before { request }

  it { expect(response).to have_http_status(:unauthorized) }
end
