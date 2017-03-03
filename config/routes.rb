Rails.application.routes.draw do
  get 'home/index'
  get 'home/about'
  get 'ping/:id', to: 'home#ping', as: :user_ping

  devise_for :users

  devise_scope :user do
    authenticated :user do
			root to: "home#index"	
	  end
		root to: "devise/sessions#new"
	end

end
