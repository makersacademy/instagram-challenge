Rails.application.routes.draw do

  resources :filterspams do
    resources :comments
  end


  root 'filterspams#index'

end
