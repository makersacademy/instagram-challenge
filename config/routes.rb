Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user do
    resources :posts, only: %i[new create edit update destroy] do
      resources :likes, only: %i[new create edit update destroy]
      resources :comments, only: %i[new create edit update destroy]
    end
  end

  get 'user_posts/index'
 
  resources :posts, only: %i[index show] do
    resources :likes, only: %i[index show]
    resources :comments, only: %i[index show]
  end


  root 'posts#index'

end
