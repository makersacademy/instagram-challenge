Rails.application.routes.draw do

	resources :pictures do
		resources :comments
	end

end
