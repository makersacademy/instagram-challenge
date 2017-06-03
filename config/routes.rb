Rails.application.routes.draw do
  get 'photos/index'

  get 'photos/new'

  get 'photos/create'

  get 'photos/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :photos
end
