require 'rails_helper'

RSpec.feature 'pictures', :type => :feature  do

	context "no pictures have been added" do

		scenario "should display a prompt to add a photo" do
			visit "/pictures"
			expect(page).to have_content "Oh noes, there are no pictures yet!"
			expect(page).to have_content "Add a Picture"
		end
	end

	context "a picture has been added" do

		before do
			Picture.create(name: "KitKat the Kitty Cat")
		end

		scenario "should display the name of the picture" do
			visit "/pictures"
			expect(page).to have_content "KitKat the Kitty Cat"
			expect(page).not_to have_content "Oh noes, there are no pictures yet!"
		end
	end

	context "creating pictures" do

		scenario "prompts a user to fill out a form, then displays the new picture" do
			visit "/pictures"
			click_link "Add a Picture"
			fill_in "Name", with: "Baby Hippo"
			fill_in "Description", with: "Saw this today, so cute!"
			click_button "Add Picture"
			expect(page).to have_content "Baby Hippo"
			expect(current_path).to eq '/pictures'
		end
	end

	context "viewing pictures" do

		before do
			Picture.create(name: "Baby Hippo", description: "Saw this today, so cute!", id: 1)
		end

		scenario "lets a user view a picture" do
			visit "/pictures"
			click_link "Baby Hippo"
			expect(page).to have_content "Baby Hippo"
			expect(page).to have_content "Saw this today, so cute!"
			expect(current_path).to eq "/pictures/1"
		end
	end

	context "editing pictures" do

		before do
			Picture.create(name: "Baby Hippo", description: "Saw this today, so cute!", id: 1)
		end

		scenario "lets a user edit a picture" do
			visit "/pictures"
			click_link "Baby Hippo"
			click_link "Edit Picture"
			fill_in "Name", with: "Shaved Guinea Pig"
			fill_in "Description", with: "I thought this was a baby hippo, oops!"
			click_button "Update Picture"
			expect(current_path).to eq "/pictures/1"
			expect(page).to have_content "Shaved Guinea Pig"
			expect(page).to have_content "I thought this was a baby hippo, oops!"
		end
	end

	context "deleting pictures" do

		before do
			Picture.create(name: "Baby Hippo", description: "Saw this today, so cute!")
		end

		scenario "lets a user delete a picture" do
			visit "/pictures"
			click_link "Baby Hippo"
			click_link "Delete Picture"
			expect(current_path).to eq "/pictures"
			expect(page).to have_content "Picture has been deleted"
			expect(page).not_to have_content "Baby Hippo"
		end
	end
end