Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'# places index view in localhost:3000/welcome/index
  root to: "welcome#index" # places index view in localhost:3000 (home page)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
