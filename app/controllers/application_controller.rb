class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ErrorJsonGeneratable
  skip_before_action :verify_authenticity_token, if: :devise_controller?
end
