class HomeController < ApplicationController
  def index
  	@users = User.all_without(current_user)
  end

  def ping_to_home
    notification = current_user.own_notifications.create(
  		recipient_id: params[:id],
      title: "#{current_user.email} ping you on home",
      description: "email: #{current_user.email}, action: #{ action_name }",
  		url: home_index_url,
      action: action_name,
  		notifiable: current_user
  	)
  	redirect_back(fallback_location: root_path)
  end

  def ping_to_about
    notification = current_user.own_notifications.create(
      recipient_id: params[:id],
      title: "#{current_user.email} ping you on about",
      description: "email: #{current_user.email}, action: #{ action_name }",
      url: home_about_url,
      action: action_name,
      notifiable: current_user
    )
    redirect_back(fallback_location: root_path)
  end
end
