Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    
  }
  get 'welcome/index'
  root 'welcome#index'

  resources :posts do
    resources :comments
  end
end
