Rails.application.routes.draw do
  namespace :api do
    resources :users, :posts
  end
  root 'home#index'
  get '/*path' => 'home#index'
end
