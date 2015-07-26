Rails.application.routes.draw do
  get 'pictues' => 'pictures#index  '
  resources :pictures
end
