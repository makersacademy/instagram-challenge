Rails.application.routes.draw do

  devise_for :users
  # set root to: "home#index" when have a home page
  resources :home
end
