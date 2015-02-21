Rails.application.routes.draw do
  get 'posts' => 'posts#index'
  resources :posts

end
