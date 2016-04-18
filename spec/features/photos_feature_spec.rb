require "rails_helper"

feature "photos" do
  let!(:user) { FactoryGirl.create(:user) }

  context "adding photos" do
    scenario "allows user to add a new photo" do
      sign_in_as(user)
      visit photos_path
      click_link "New Photo"
      attach_file :photo_image, "./spec/images/kitten.jpg"
      fill_in "Status", with: "Fluffy kitten"
      click_button "Post"

      expect(current_path).to eq photos_path
      expect(page).to have_css "img[src*=kitten]"
      expect(page).to have_content "Fluffy kitten"
      within ".creator" do
        expect(page).to have_content user.username
      end
    end

    scenario "guest has to sign in before adding a photo" do
      visit photos_path
      expect(page).not_to have_link "New Photo"
    end
  end

  context "displaying photos" do
    let!(:earlier) { Time.parse("2016-04-15 11:02:56 +0000") }
    let!(:pic_1) { FactoryGirl.create(:photo, created_at: earlier) }

    before do
      now = Time.parse("2016-04-17 13:02:56 +0100")
      allow(Time).to receive(:now).and_return(now)
    end

    scenario "should display the time photo was created relative to now" do
      visit photos_path
      expect(page).to have_content "2d"
    end

    scenario "should display photos in reverse chronological order" do
      later = Time.parse("2016-04-17 12:02:56 +0100")
      pic_2 = FactoryGirl.create(:photo, created_at: later)
      visit photos_path

      within "li ul:first-child" do
        expect(page).to have_content pic_2.status
        expect(page).to have_content "1h"
      end

      within "li ul:last-child" do
        expect(page).to have_content pic_1.status
        expect(page).to have_content "2d"
      end
    end
  end

  context "viewing photos" do
    scenario "allows user to view a photo" do
      photo = FactoryGirl.create(:photo)
      visit photos_path
      find(".image").click

      expect(current_path).to eq photo_path(photo)
      expect(page).to have_css "img[src*=kitten]"
      expect(page).to have_content photo.status
    end
  end

  context "editing photo status" do
    let!(:photo) { FactoryGirl.create(:photo, user: user) }

    scenario "allows user to edit a photo's status" do
      sign_in_as(user)
      visit photos_path
      find(".edit-status").click_link "Edit"
      fill_in "Status", with: "Fluffy kitten"
      click_button "Save"

      expect(page).to have_content "Fluffy kitten"
      expect(current_path).to eq photos_path
    end

    context "cannot edit other users' photos" do
      before do
        other_user = FactoryGirl.create(:user)
        sign_in_as(other_user)
      end

      scenario "cannot edit other users photo status on user interface" do
        visit photos_path
        expect(page).not_to have_css ".edit-status"
      end

      scenario "cannot edit other users photos via a update request" do
        page.driver.submit :patch, photo_path(photo.id), status: "Hacking"
        expect(current_path).to eq photos_path
        expect(page).to have_content photo.status
        expect(page).not_to have_content "Hacking"
      end
    end
  end

  context "deleting photos" do
    let!(:photo) { FactoryGirl.create(:photo, user: user) }

    scenario "allows user to delete a photo" do
      sign_in_as(user)
      visit photos_path
      find(".delete-photo").click_link "Delete"

      expect(page).not_to have_css "img[src*=kitten]"
      expect(page).not_to have_content photo.status
      expect(current_path).to eq photos_path
    end

    context "cannot delete other users' photos" do
      before do
        other_user = FactoryGirl.create(:user)
        sign_in_as(other_user)
      end

      scenario "cannot delete other users photos on user interface" do
        visit photos_path
        expect(page).not_to have_link "Delete"
      end

      scenario "cannot delete other users photos via a delete request" do
        page.driver.submit :delete, photo_path(photo.id), {}
        expect(current_path).to eq photos_path
        expect(page).to have_content photo.status
      end
    end
  end
end
