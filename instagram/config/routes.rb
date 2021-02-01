Rails.application.routes.draw do
  root "posts#index"
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/posts", to: "posts#index"
end
