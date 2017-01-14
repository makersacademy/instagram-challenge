Rails.application.routes.draw do
  root 'photos#index'
  get 'photos' => 'photos#index'
  resources :photos do
    resources :comments
  end
end
