Rails.application.routes.draw do
  get 'comments/create'

  get 'photos/index'
  get 'welcome/index'

  resources :photos, :comments

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
