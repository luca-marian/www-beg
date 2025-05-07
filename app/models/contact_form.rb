# frozen_string_literal: true

class ContactForm < MailForm::Base
  attribute :name,    validate: true
  attribute :email,   validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :message, validate: true
  attribute :subject, validate: true

  append :remote_ip, :user_agent  # Removed :session for safety

  def headers
    {
      subject: sanitized_subject,
      to: "email-from-web@#{Cms::Application.config.x.site_config.domain}",
      from: %("#{sanitize(name)}" <#{sanitize(email)}>)
    }
  end

  private

  # Strip out newline characters to prevent email header injection
  def sanitize(value)
    value.to_s.gsub(/[\r\n]/, '').strip
  end

  def sanitized_subject
    sanitize(subject)
  end
end