Rails.application.routes.draw do
  root "welcome#index"
  resources :users 
  resources :posts do
    resources :likes
    resources :comments, only: [:new, :create]
  end

resources :sessions, only: [:new, :create, :destroy]
get "/users/new", to: "users#new"
post "/users", to: "users#create"
get 'sessions/new'
post 'sessions/create'
get 'sessions/destroy'
get "comments/new" 
post "posts/:post_id/comments", to:'comments#create'
get '/index_API', to: "posts#index_API"




get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
end
