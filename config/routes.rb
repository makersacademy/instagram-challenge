Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :insta_posts do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
