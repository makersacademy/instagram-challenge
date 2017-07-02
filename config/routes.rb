Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints Clearance::Constraints::SignedIn.new do
    resources :posts do
      resources :comments
    end
    root 'posts#index'
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/sessions#new"
  end
end
