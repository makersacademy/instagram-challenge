Rails.application.routes.draw do
  devise_for :users
  root "instapics#index"

resources :instapics
end
