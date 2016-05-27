Rails.application.routes.draw do
  root "pictures#index"

  resources :pictures do
    collection do
      get 'my_pictures'
    end
  end

end
