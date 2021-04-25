Rails.application.routes.draw do
  root 'homepage#index'
  namespace :api do
    namespace :v1 do
      get 'users/index'
      post 'users/create'
      get 'users/show/:id', to: "users#show"
      get 'users/authenticate/:username/:password', to: "users#authenticate"
      delete 'users/destroy/:id', to: "users#destroy"
    end
  end
  get '/*path' => 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
