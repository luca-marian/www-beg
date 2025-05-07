# frozen_string_literal: true

module AdminAuthorization
  def authorize
    session[:auth_key].present?
  end
end
