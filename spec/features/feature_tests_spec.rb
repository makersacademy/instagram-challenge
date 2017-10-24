require 'rails_helper'

RSpec.feature "Feature Tests", type: :feature do

	context 'Images' do
		scenario 'user can submit a photo' do
			visit "/users/sign_up"
			fill_in "user_name", with: 'Example User'
		end
	end
end