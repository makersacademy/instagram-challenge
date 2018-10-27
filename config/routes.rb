Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts do
    # resources :likes
    resources :comments
    member do
      put "like", to: "posts#upvote"
    end
  end

end
