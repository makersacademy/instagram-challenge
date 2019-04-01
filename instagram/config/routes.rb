Rails.application.routes.draw do
  get 'welcome/index'
  resources :pictures
  root 'welcome#index'
end
