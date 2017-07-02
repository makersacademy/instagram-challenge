Rails.application.routes.draw do
  root :to => 'posts#index'

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, controller: 'users', only: 'create'
  
#  as :user do
#    get 'login', to: 'clearance/sessions#new'
#    get 'register', to: 'clearance/users#new'
#    delete 'logout', to: 'clearance/sessions#destroy'
#  end
  
#  clearance_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
#  
  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end
end
