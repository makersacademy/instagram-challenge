Rails.application.routes.draw do

  devise_for :users

  resources :pictures do
    resources :comments
    member do
     put 'like', to: "pictures#upvote"
    end
  end

  root 'pictures#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
