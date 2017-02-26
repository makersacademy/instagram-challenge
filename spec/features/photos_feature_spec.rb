require "rails_helper"

feature "photos" do
  include Helpers

  context "no photos have been added" do
    scenario "displays a prompt to add a photos" do
    visit photos_path
    expect(page).to have_content "No photos yet"
    expect(page).to have_link "Add Photo"
    end
  end

  context "adding photos" do
    let!(:user) { FactoryGirl.create(:user) }

    scenario "user can add a new photo" do
      user_sign_in(user)
      visit photos_path
      click_link "Add Photo"
      attach_file :photo_image, "./spec/images/coffee.jpg"
      fill_in "Caption", with: "Morning coffee"
      click_button "Post"

      expect(current_path).to eq photos_path
      expect(page).to have_content "Morning coffee"
    end
  end

  context 'viewing photos' do
    scenario "allows user to view a photo" do

      photo = FactoryGirl.create(:photo)
      visit photos_path
      find(".image").click
      expect(current_path).to eq photo_path(photo)
      expect(page).to have_content photo.caption
    end
  end

  context "editing a photo\'s caption" do

    let!(:user) { FactoryGirl.create(:user) }
    let!(:photo) { FactoryGirl.create(:photo, user: user) }

    scenario "allows user to update it" do
      user_sign_in(user)
      visit photos_path
      find(".edit-status").click_link "Edit"
      fill_in "Caption", with: "Morning glory"
      click_button "Save"
      expect(page).to have_content "Morning glory"
      expect(current_path).to eq photos_path
    end

    context "a user cannot edit photos of other users" do
      before do
        other_user = FactoryGirl.create(:user)
        user_sign_in(other_user)
      end

      scenario "prevents from editing other users photo status" do
        visit photos_path
        expect(page).not_to have_css ".edit-status"
      end
    end
  end

  context "deleting photos" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:photo) { FactoryGirl.create(:photo, user: user) }

    scenario "allows a user to delete a photo" do
      user_sign_in(user)
      visit photos_path
      click_link "Delete"
      expect(page).not_to have_css "img[src*=coffee]"
      expect(page).not_to have_content photo.caption
      # expect(page).to have_content "Successfully deleted the photo!"
      expect(current_path).to eq photos_path
    end

    context "cannot delete photos that belong to other users" do
      before do
        other_user = FactoryGirl.create(:user)
        user_sign_in(other_user)
      end

      scenario "prevents from deleting other users photos on user interface" do
        visit photos_path
        expect(page).not_to have_link "Delete"
      end

    end
  end

end
