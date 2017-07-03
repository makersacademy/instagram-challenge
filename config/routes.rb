Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'

  constraints Clearance::Constraints::SignedIn.new do
    resources :pictures do
      resources :comments
    end
  end
end
