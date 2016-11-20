Rails.application.routes.draw do

  resources :photos, shallow: true do
    resources :comments do
      resources :comments do
      end
    end
    resources :reactions do
    end
  end

   root to: "photos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
