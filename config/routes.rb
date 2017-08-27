Rails.application.routes.draw do

  devise_for :users
  
  resources :posts do
    resources :likes
  end

  root to: 'posts#index'
end
