Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do 
    resources :comments
    resources :likes
    resources :dislikes
  end
end
