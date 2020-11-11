require 'rails_helper'


RSpec.feature('Signing up') do
	scenario('User vists users/sign_up') do
		sign_up
		expect(page).to have_content "Hi dill! Hope you have a great time!"
		expect(page).to have_content "Posts"
		expect(page).to have_content "Sign Out"
	end
end
