Rails.application.routes.draw do
  devise_for :users do
    resources: :wallposts
  end
    
  get 'welcome/index'
  root 'welcome#index'

  resources :posts do
    resources :comments
  end
  
end
