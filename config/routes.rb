Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'welcome/index' # places index view in localhost:3000/welcome/index
  resources :posts
  root to: 'welcome#index' # places index view in localhost:3000 (home page)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
