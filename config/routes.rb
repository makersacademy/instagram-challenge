Rails.application.routes.draw do
  resources :posts do
    resources :comments do
    end
  end
  devise_for :users
  root to: 'home#front'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
