Rails.application.routes.draw do
  get 'photo/new'

  get 'photo/create'

  get 'photo/update'

  get 'photo/edit'

  devise_for :users
  resources :feeds do
    resources :photos
  end
  resources :welcome

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
