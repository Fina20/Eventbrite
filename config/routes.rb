Rails.application.routes.draw do

	root to: 'events#index'

	
	post '/events/new', to: 'events#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  post '/events/:id', to: 'events#subscribe'

  resources :users

  resources :events

  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
