require 'rails_helper'

RSpec.feature 'pictures', :type => :feature  do

	context "no pictures have been added" do

		scenario "should display a prompt to add a photo" do
			visit '/pictures'
			expect(page).to have_content "Oh noes, there are no pictures yet!"
			expect(page).to have_content "Add a Picture"
		end
	end

	context "a picture has been added" do

		before do
			Picture.create(name: "KitKat the Kitty Cat")
		end

		scenario "should display the name of the picture" do
			visit '/pictures'
			expect(page).to have_content "KitKat the Kitty Cat"
			expect(page).not_to have_content "Oh noes, there are no pictures yet!"
		end
	end

	context "creating pictures" do

		scenario "prompts a user to fill out a form, then displays the new picture" do
			visit '/pictures'
			click_link "Add a Picture"
			fill_in "Name", with: "Baby Hippo"
			click_button "Add Picture"
			expect(page).to have_content "Baby Hippo"
			expect(current_path).to eq '/pictures'
		end
	end
end