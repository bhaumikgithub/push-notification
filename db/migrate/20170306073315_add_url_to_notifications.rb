class AddUrlToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :url, :text
  end
end
