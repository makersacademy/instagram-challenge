Rails.application.routes.draw do
  devise_for :users
  get 'pictures/index'

  resource :pictures do
    resources :likes
  end

  root to: "pictures#index"
end
