# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ErrorJsonGeneratable

  before_action :authenticate_user!, unless: :devise_controller?
  skip_before_action :verify_authenticity_token, if: :devise_controller?
end
