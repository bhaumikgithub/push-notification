class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
  	notifier = notification.user
  	recipient = notification.recipient
  	title = "#{notifier.email} ping you"
  	description = "email: #{notifier.email}, action: #{ notification.action }"
    if notification.action == "ping_to_home"
    	ActionCable.server.broadcast "push_notifications:#{notification.recipient_id}", { title: title, description: description, url: path_helper.home_index_path }
    elsif notification.action == "ping_to_about"
    	ActionCable.server.broadcast "push_notifications:#{notification.recipient_id}", { title: title, description: description, url: path_helper.home_about_path }
    end
  end

  private

  def path_helper
  	Rails.application.routes.url_helpers
  end
end
