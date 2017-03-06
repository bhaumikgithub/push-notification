class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
  	notifier = notification.user
  	recipient = notification.recipient
  	title = "#{notifier.email} ping you"
  	description = "email: #{notifier.email}, action: #{ notification.action }"
    if notification.action == "ping_to_home"
    	ActionCable.server.broadcast "push_notifications:#{notification.recipient_id}", { title: title, description: description, url: route_path_helper.home_index_path, icon_url: assets_path_helper.asset_path("missing.png") }
    elsif notification.action == "ping_to_about"
    	ActionCable.server.broadcast "push_notifications:#{notification.recipient_id}", { title: title, description: description, url: route_path_helper.home_about_path, icon_url: assets_path_helper.asset_path("missing.png") }
    end
  end

  private

  def route_path_helper
  	Rails.application.routes.url_helpers
  end

  def assets_path_helper
  	ActionController::Base.helpers
  end
end
