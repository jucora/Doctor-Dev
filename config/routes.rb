Rails.application.routes.draw do
	root 'sessions#new'
	delete 'logout', to: 'sessions#delete'

	get 'transactions', to: 'transactions#transactions'
	get 'external_transactions', to: 'transactions#external_transactions'
	
	resources :users
	resources :sessions
	resources :groups, only: :index
end
