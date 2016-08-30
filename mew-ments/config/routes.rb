Rails.application.routes.draw do
  root 'mewments#index'
  devise_for :users
  get 'mewments' => 'mewments#index'
  resources :mewments do
    resources :comments
    resources :likes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
