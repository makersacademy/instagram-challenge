Rails.application.routes.draw do
  resources :images do
    resources :loves
  end
end
