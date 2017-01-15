Rails.application.routes.draw do

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	
	resources :pictures do
		resources :comments
	end

	root "pictures#index"

end
