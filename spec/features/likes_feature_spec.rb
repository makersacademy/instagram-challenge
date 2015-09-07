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
    end
  end
end