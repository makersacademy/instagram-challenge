require 'rails_helper'
require_relative '../helpers/sign_up.rb'

RSpec.feature('Signing in') do
	scenario('User vists users/sign_in') do
		sign_up
        visit destroy_user_session_path
        visit('/users/sign_in')
        fill_in :user_username, with: "dill"
        fill_in :user_email, with: "anemail@email.com"
        fill_in :user_password, with: "123456"
        click_button "Login"
        expect(page).to have_content "Hi dill! Hope you have a great time!"
		expect(page).to have_content "Posts"
	end
end
