Rails.application.routes.draw do
  resources :pictures do
    resources :userthoughts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
