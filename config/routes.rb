Rails.application.routes.draw do
  devise_for :users#, coontrollers: { omniauth_callbacks: '/users/omniauth_callbacks' }
  
  root 'posts#index'
  resources :posts do 
    resources :comments
    resources :likes
    resources :dislikes
  end
end
