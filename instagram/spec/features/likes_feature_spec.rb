require 'rails_helper'

feature "liking photos" do
  before 
    # {user = User.create}
    # {user.Photo.create description: "Fujisan"}


  scenario "each photo starts with 0 likes" do
     visit "/photos"
     expect(page).to have_content("0 likes")
     expect(page).not_to have_content("1 likes")
  end

  context "when user is signed in" do
  	scenario "can like a photo, and update like counter" do
  		visit "/photos"
  		click_link "Like"
  		expect(page).to have_content "1 like"
  		expect(page).not_to have_content "0 likes"
  	end
  end

  context "when user is NOT signed in" do
		scenario "cannot like a photo, counter does not update" do
			visit "/photos"
			click_link "Like"
			expect(page).to have_content "0 like"
			expect(page).not_to have_content "1 likes"
			expect(page).to have_content "Please log in"
		end
  end

end