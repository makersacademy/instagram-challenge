Rails.application.routes.draw do
  root "posts#index"

  get "/timeline", to: "timeline#index"
  
  resources :posts
  

end
