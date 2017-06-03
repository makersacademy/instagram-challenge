Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/users#new"
    get '/photos' => 'clearance/users#new'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "photos#index", as: :signed_in_root
    resources :photos
  end
end
