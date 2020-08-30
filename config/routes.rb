Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get 'sessions/destroy', to: 'sessions#destroy'

  get '/pictures', to: 'pictures#list'
  post '/pictures', to: 'pictures#create'
end
