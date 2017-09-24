require 'rails_helper'

RSpec.feature "Feature Tests", type: :feature do

	context 'Images' do
		scenario 'user can submit a photo' do
			visit "/users/sign_up"
		end
	end
end