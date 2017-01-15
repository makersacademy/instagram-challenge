require 'rails_helper'

RSpec.feature 'pictures', :type => :feature  do

	context "no pictures have been added" do

		scenario "should display a prompt to add a photo" do
			visit '/pictures'
			expect(page).to have_content "Oh noes, there are no pictures yet!"
			expect(page).to have_content "Add a Picture"
		end
	end
end