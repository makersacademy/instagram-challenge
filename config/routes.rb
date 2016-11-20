Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "posts#index"
    
    get "/posts/images/:id" => "posts#show_image"

    resources :posts do
      resources :comments
    end
end
