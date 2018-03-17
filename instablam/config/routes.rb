Rails.application.routes.draw do
  get 'welcome/index'

  resources :pictures do
    resources :comments
  end

  root 'welcome#index'
end
