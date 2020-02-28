Rails.application.routes.draw do
	root 'sessions#new'
	delete 'logout', to: 'sessions#delete'

	get 'transactions', to: 'transactions#transactions'
	get 'external_transactions', to: 'transactions#external_transactions'
	get 'group_transactions', to: 'groups#group_transactions'

	resources :users
	resources :sessions
	resources :groups
	resources :transactions
end
