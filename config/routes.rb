Rails.application.routes.draw do
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get 'welcome/about'
	root 'welcome#index'
end
