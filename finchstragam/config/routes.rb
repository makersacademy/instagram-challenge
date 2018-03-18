Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users

  resources :pictures do
    post 'like' => 'pictures#like'
    delete 'unlike' => 'pictures#unlike'
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect('/welcome/index')
end
