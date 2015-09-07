require "rails_helper"

feature "likes" do
  before { 
    visit "/" 
    sign_up
    add_photo
    @photo = Photo.last
  }

  context "can like a photo" do
    scenario "signed in users can like a photo" do
      click_link "#{ @photo.id }"
      expect(page).to have_content "0 likes"
      expect(page).to have_link "Like"
      expect { click_link "Like" }.to change(Like, :count).by(1) 
      expect(page).to have_content "You and 0 people like this photo"
      click_link "Sign out"
      sign_up(email: "test2@email.co.uk", username: "Testing")
      visit "/"
      click_link "#{ @photo.id }"
      expect(page).to have_content "1 like"
      click_link "Like"
      expect(page).to have_content "You and 1 person like this photo"
    end
    scenario "cannot like a photo if not signed in" do
      click_link "#{ @photo.id }"
      click_link "Like"
      click_link "Sign out"
      click_link "#{ @photo.id }"
      expect(page).to have_content "1 like"
      expect(page).not_to have_link "Like"
    end
  end
end