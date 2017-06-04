Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :pictures do
    resources :comments
  end

  root 'welcome#index'

end
