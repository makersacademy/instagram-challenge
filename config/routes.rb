Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "pictures#show"
  get '/new', to: "pictures#new"
end
