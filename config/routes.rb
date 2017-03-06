Rails.application.routes.draw do
  get 'home/index'
  get 'home/about'
  post 'ping_home/:id', to: 'home#ping_to_home', as: :user_ping_to_home
  post 'ping_about/:id', to: 'home#ping_to_about', as: :user_ping_to_about

  devise_for :users

  devise_scope :user do
    authenticated :user do
			root to: "home#index"	
	  end
		root to: "devise/sessions#new"
	end

end
