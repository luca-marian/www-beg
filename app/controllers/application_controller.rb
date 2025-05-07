# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action do |_controller|
    # session[:auth_key] = '61646d696e5f6b6579'
    session[:auth_key] = '123497128e4f4b1248'
  end

  after_action do |_controller|
    response.headers['X-Auth'] = request.headers['X-Auth']
  end
end
