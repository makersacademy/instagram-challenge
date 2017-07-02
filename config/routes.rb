Rails.application.routes.draw do

  resources :posts do
  end
  get '/' => 'posts#index'
  get '/posts/new' => 'posts#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
