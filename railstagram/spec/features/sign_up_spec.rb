require 'rails_helper'
require_relative '../helpers/sign_up.rb'

RSpec.feature('Signing up') do
	scenario('User vists users/sign_up') do
		sign_up
		expect(page).to have_content "Hi dill! Hope you have a great time!"
		expect(page).to have_content "Posts"
		expect(page).to have_content "Sign Out"
	end
end
