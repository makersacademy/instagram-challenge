Rails.application.routes.draw do
  resources :posts
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end
  devise_scope :user do
    root "devise/sessions#create"
  end
end
