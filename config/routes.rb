Rails.application.routes.draw do
  resources :photos do
    resources :comments
  end
end
