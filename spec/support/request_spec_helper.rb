# frozen_string_literal: true

module Supports::RequestSpecHelper
  def sign_in_user
    let(:params) do
      {
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password'
      }
    end
    let(:header) do
      { 'Content-Type': 'application/json' }
    end

    let(:auth_header) do
      post '/api/auth', params: params, header: header
      {
        'access-token': response['access-token'],
        'client': response['client'],
        'uid': response['uid']
      }
    end
  end

  def auth_spec_request(user)
    request.headers.merge!(user.create_new_auth_token) if sign_in(user)
  end
end
