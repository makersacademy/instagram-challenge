Rails.application.routes.draw do
  namespace :admin do
      resources :comments
      resources :posts
      resources :users

      root to: "comments#index"
    end
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'welcome/index'
  get '/posts/new' => 'posts#new', as: "new_post_path"
  post '/posts' => 'posts#create'
  get '/posts' => 'posts#index'
  delete '/posts' => 'posts#destroy'
  root to: 'posts#index'
  post '/comments' => 'posts#comment_new', as: "comments"
  delete '/comments' => 'posts#comment_destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
