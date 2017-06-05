Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'welcome#index'

  get '/photos', to: 'photos#index'

  get '/', to: 'welcome#index'

  resource :users, :photos

end
