require 'rails_helper'

RSpec.feature 'users', :type => :feature  do

	include WebHelpers

	context "user can sign in or sign up" do

		scenario "signed out user can see a sign in and sign up link on the homepage" do
			visit "/"
			expect(page).to have_link "Sign In"
			expect(page).to have_link "Sign Up"
			expect(page).not_to have_link "Sign Out"
		end
	end

	context "user can sign out" do

		before do
			sign_up
		end

		scenario "signed in user can see a sign out link on the homepage" do
			visit "/"
			expect(page).to have_link "Sign Out"
			expect(page).not_to have_link "Sign In"
			expect(page).not_to have_link "Sign Up"
		end
	end
end