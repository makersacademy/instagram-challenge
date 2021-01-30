Rails.application.routes.draw do
  get 'users/index'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  post 'users/new', to: "users#create"
end
