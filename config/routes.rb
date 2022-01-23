Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }


  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  get '/posts', to: 'posts#index'

  resources :posts
# get "/posts/:id", to: "posts#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
