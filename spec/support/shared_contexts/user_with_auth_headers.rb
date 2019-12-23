# frozen_string_literal: true

RSpec.shared_context :user_with_auth_headers do
  let(:user) { create(:user) }
  let(:auth_headers) do
    auth_token(user).merge!({ 'Content-Type': 'application/json' })
  end
end