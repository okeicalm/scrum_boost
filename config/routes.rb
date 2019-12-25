# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'

  namespace 'api' do
    resources :projects, only: %i[create]
  end
end
