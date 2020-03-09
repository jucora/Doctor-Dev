Rails.application.routes.draw do
	root 'sessions#new'
	delete 'logout', to: 'sessions#delete'

	resources :users, only:[:new, :create, :show]
	resources :sessions, only:[:new, :create]
	resources :groups, except: [:edit, :update, :destroy] 
	resources :transactions, except:[:edit, :update, :destroy] 
end
