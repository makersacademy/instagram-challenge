Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :pictures do
    resources :comments
    resources :likes
  end

  root 'welcome#index'
end
