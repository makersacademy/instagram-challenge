Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts, concerns: :paginatable do
    resources :comments
    
    concern :paginatable do
      get '(page/:page)', action: :index, on: :collection, as: ''
    end
  end


  root 'posts#index'
end
