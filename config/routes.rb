Rails.application.routes.draw do
  resources :posts do
    resources :likes
  end
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end
