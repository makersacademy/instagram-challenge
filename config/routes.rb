Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'turtlegrams' => 'turtlegrams#index'
  resources :users
  get 'users/:id' => 'users#show'
  resources :turtlegrams do
    resources :comments
  end

  root 'turtlegrams#index'
end
