Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    # root "application#index" #controller name 'home' and a method name 'index'
    root "public#homepage"
end
