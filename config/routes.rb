Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts do
    resources :comments
  end

  root 'welcome#index'
end
