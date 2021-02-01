Rails.application.routes.draw do
  root 'users#new'
  resources :users
  resources :sessions
  resources :photos do
    resources :likes
  end 
  post 'photos/capture'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
