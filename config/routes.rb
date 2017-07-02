Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints Clearance::Constraints::SignedIn.new do
    resources :pictures
  end

  get '/', to: "pictures#show"
  get '/new', to: "pictures#new"
  post '/new', to: "pictures#create"
  post '/new_comment', to: "comments#create"
end
