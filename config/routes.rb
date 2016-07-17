Rails.application.routes.draw do
  get 'posts' => 'posts#index'

  resources :posts do
    resources :comments
  end

end
