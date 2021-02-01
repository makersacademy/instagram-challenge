Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :users, param: :slug
      resources :posts
    end
  end

  get '*path', to: 'pages#index', via: :all
end
