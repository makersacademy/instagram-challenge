Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users

  resources :users do
    resources :pictures do
      resources :comments
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect('/welcome/index')
end
