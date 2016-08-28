Rails.application.routes.draw do
  get 'mewments' => 'mewments#index'
  resources :mewments do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
