Rails.application.routes.draw do
  root "posts#index"

  get "/posts", to: "posts#index"
end
