Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticate :user do
    resources :posts, only: %i[new create edit update destroy]
  end

  

  resources :posts, only: %i[index show]

  root 'posts#index'
  authenticate :user do
    resources :posts, only: %i[new create edit update destroy]
  end
end
