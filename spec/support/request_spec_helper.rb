# frozen_string_literal: true

module RequestSpecHelper
  def auth_token(user)
    user.create_new_auth_token if sign_in(user)
  end
end
