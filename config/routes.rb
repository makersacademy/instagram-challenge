Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "photographs#index"
  get 'photographs' => 'photographs#index'
  resources :photographs do
    resources :comments
  end
end
