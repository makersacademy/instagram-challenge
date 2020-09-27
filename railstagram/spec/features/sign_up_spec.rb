require 'rails_helper'

RSpec.feature('Signing up') do
	scenario('User vists users/sign_up') do
		visit('/users/sign_up')
		expect(page).to have_content "Sign up"
	end
end
