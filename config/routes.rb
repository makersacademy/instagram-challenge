Rails.application.routes.draw do
  delete '/posts/:id/likes', to: 'likes#destroy'
  resources :posts do
    resources :likes
  end
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end
