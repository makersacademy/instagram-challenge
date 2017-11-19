Rails.application.routes.draw do
  devise_for :users
  resources :pins do
    resources :comments
    member do
      get 'like'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pins#index'
end
