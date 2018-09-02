Rails.application.routes.draw do
  root to: redirect('instaposts')
  get 'pages/about'
  resources :instaposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
