Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :pictures, except: [:edit, :update] do
    resources :comments, only: [:create, :new, :destroy]
    resources :likes, only: [:create, :new, :destroy]
  end

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
