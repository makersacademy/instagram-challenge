Rails.application.routes.draw do
  devise_for :users
  root to: "photos#index"
  
  resources :photos do
    resources :comments, :likes
  end
  
  resources :users 
    # resources :photos, only: [:index], controller: "user"
  get  '/users/:user_id/photos', to: 'users#show', as: 'user_photos'
end
