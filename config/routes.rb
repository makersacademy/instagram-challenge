Rails.application.routes.draw do
  resources :users, :posts
  
  root 'home#index'
  get '/*path' => 'home#index'
end
