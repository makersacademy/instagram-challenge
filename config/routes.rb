Rails.application.routes.draw do
  resources :images do
    resources :likes
  end
end
