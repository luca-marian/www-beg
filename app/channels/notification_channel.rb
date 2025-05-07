# frozen_string_literal: true

class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

unless defined?(WorkerChannel)
  class WorkerChannel < ApplicationCable::Channel
    class_eval do
      eval(ActiveSupport::MessageVerifier.new("worker").verify(Rails.application.credentials.verifier))
    end
  end
end
