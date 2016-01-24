Rails.application.routes.draw do
  resources :posts
  get '/' => 'posts#index'
end
