class PushNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "push_notifications:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
