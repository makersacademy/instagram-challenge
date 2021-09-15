Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users
  

  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  devise_scope :user do
    root 'devise/sessions#new' 
  end
end
