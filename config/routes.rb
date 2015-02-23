Rails.application.routes.draw do
  root to: "posts#index"
  get 'posts' => 'posts#index'
  
  resources :posts do
    resources :comments
  end

end
