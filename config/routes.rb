Rails.application.routes.draw do
  devise_for :users
  root 'index#index'
end
