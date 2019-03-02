Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

end
