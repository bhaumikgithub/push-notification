class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
  	notifier = notification.user
  	recipient = notification.recipient
  	title = "#{notifier.email} ping you"
  	description = "email: #{notifier.email}, action: #{ notification.action }"
    ActionCable.server.broadcast "push_notifications:#{notification.recipient_id}", { title: title, description: description, url: "/" }
  end
end
