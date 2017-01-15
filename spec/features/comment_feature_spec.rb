require 'rails_helper'

RSpec.feature 'commenting', :type => :feature  do

	include WebHelpers

	context "creating comments" do

		before do
			Picture.create(name: "Baby Hippo", description: "Saw this today, so cute!", id: 1)
		end

		scenario "user can leave a comment on a picture" do
			sign_up
			visit "/pictures"
			click_link "Baby Hippo"
			click_link "Add Comment"
			fill_in "Thoughts", with: "OMG this is adorable!"
			click_button "Post Comment"
			expect(current_path).to eq "/pictures/1"
			expect(page).to have_content "OMG this is adorable!"
		end
	end
end