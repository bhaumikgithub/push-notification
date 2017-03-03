class HomeController < ApplicationController
  def index
  	@users = User.all_without(current_user)
  end

  def ping
  	notification = current_user.own_notifications.create(
  		recipient_id: params[:id],
  		action: action_name,
  		notifiable: current_user
  	)
  	redirect_to :back
  end
end
