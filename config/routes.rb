Rails.application.routes.draw do
  resources :posts do
    resources :likes
  end

  root to: 'posts#index'
end
