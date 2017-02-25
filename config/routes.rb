Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :posts
  end

  root to: "welcome#index"

end
