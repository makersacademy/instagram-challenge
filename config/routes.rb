Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: "pictures#index"
  resources :pictures do
    resources :comments
    resources :likes
  end

end
