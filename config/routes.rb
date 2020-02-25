Rails.application.routes.draw do
	root 'sessions#new'
	delete 'logout', to: 'sessions#delete'
	
	resources :users
	resources :sessions
end
