Rails.application.routes.draw do
  devise_for :users
    
  get 'welcome/index'
  root 'welcome#index'

  resources :posts do
    resources :comments
  end

  put '/posts/:id/like', to: 'posts#like', as: 'like'
  
  
end
