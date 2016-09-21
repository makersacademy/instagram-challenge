Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "photographs#index"
  get 'photographs' => 'photographs#index'
  resources :photographs do
    resources :comments
    resources :admiration
  end
end
