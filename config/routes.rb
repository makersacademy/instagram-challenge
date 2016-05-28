Rails.application.routes.draw do
  root "pictures#index"

  resources :pictures do
    resources :comments, shallow: true
    collection do
      get 'my_pictures'
    end
  end

end
