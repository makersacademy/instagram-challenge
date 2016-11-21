require 'rails_helper'

feature 'homepage' do
	context 'visiting the homepage' do
		scenario 'Should display site name' do
			visit '/instapik'
			expect(page).to have_content("Welcome to Insta-Pik!")
		end
		scenario "Should contain link to 'Sign Up'" do
			visit '/instapik'
			expect(page).to have_button("Sign Up")
		end
	end
end

