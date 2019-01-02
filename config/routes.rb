Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users

  resources :posts do
    resources :comments, :likes
  end

  root 'posts#index'








  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
