Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pics do
    resources :comments
  end

  devise_scope :user do
    unauthenticated do
      root :to => 'devise/registrations#new'
    end

    authenticated do
      root :to => 'pics#index'
    end
  end  

end
