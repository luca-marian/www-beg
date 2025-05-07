# frozen_string_literal: true

module AdminAuthentication
  def authenticate
    authenticate_session || authenticate_cookie || authenticate_basic
  end

  private

  def authenticate_basic
    authenticate_or_request_with_http_basic do |username, password|
      if BasicAuthenticator.check(username, password)
        session[Rails.application.config.x.auth_cookie_key] =
          cookies[Rails.application.config.x.auth_cookie_key] = username
      end
    end
  end

  def authenticate_session
    Rails.application.config.x.admin_users.include? session[Rails.application.config.x.auth_cookie_key]
  end

  def authenticate_cookie
    Rails.application.config.x.admin_users.include? cookies[Rails.application.config.x.auth_cookie_key]
  end
end
