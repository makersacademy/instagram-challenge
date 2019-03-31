Rails.application.routes.draw do
  resources :hams

  root 'welcome#index'
end
