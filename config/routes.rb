Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :posts
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#the "posts#index route sets the base root as posts"
