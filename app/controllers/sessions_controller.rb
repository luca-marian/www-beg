class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user_info = request.env['omniauth.auth']
    Rails.application.config.x.admin_users << user_info["preferred_username"]
    session[Rails.application.config.x.auth_cookie_key] = user_info["preferred_username"]
    redirect_to '/admin'
  end
end